<?php
session_start();

// Conexão com o banco de dados
$host = 'localhost';
$user = 'root'; 
$pass = ''; 
$db   = 'sisgna'; 

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Função para atualizar as informações do setor do aluno via POST
if (isset($_POST['update_setor'])) {
    if (isset($_POST['id'])) {
        foreach ($_POST['id'] as $index => $id) {
            $alergia = $_POST['alergia'][$id]; 
            $ja_reprovou = $_POST['ja_reprovou'][$id]; 
            $interno = $_POST['interno'][$id]; 
            $orientador_amostra_ciencias = $_POST['orientador_amostra_ciencias'][$id]; 

            $sql_check = "SELECT * FROM informacoes_adicionais WHERE aluno_id = ?";
            $stmt_check = $conn->prepare($sql_check);
            $stmt_check->bind_param("i", $id);
            $stmt_check->execute();
            $result_check = $stmt_check->get_result();

            if ($result_check->num_rows > 0) {
                $row_check = $result_check->fetch_assoc();
                if ($row_check['alergia'] !== $alergia || $row_check['ja_reprovou'] !== $ja_reprovou || $row_check['interno'] !== $interno || $row_check['orientador_amostra_ciencias'] !== $orientador_amostra_ciencias) {
                    $sql_info = "UPDATE informacoes_adicionais SET alergia = ?, ja_reprovou = ?, interno = ?, orientador_amostra_ciencias = ? WHERE aluno_id = ?";
                    $stmt_info = $conn->prepare($sql_info);
                    $stmt_info->bind_param("sssss", $alergia, $ja_reprovou, $interno, $orientador_amostra_ciencias, $id);

                    if ($stmt_info->execute()) {
                        $_SESSION['mensagem_sucesso'] = "Informações do setor salvas com sucesso!";
                    } else {
                        $_SESSION['mensagem_erro'] = "Erro ao atualizar informações adicionais!";
                    }
                }
            } else {
                $sql_info = "INSERT INTO informacoes_adicionais (aluno_id, alergia, ja_reprovou, interno, orientador_amostra_ciencias) VALUES (?, ?, ?, ?, ?)";
                $stmt_info = $conn->prepare($sql_info);
                $stmt_info->bind_param("issss", $id, $alergia, $ja_reprovou, $interno, $orientador_amostra_ciencias);

                if ($stmt_info->execute()) {
                    $_SESSION['mensagem_sucesso'] = "Informações do setor salvas com sucesso!";
                } else {
                    $_SESSION['mensagem_erro'] = "Erro ao inserir informações adicionais!";
                }
            }
        }
    } else {
        $_SESSION['mensagem_erro'] = "ID do aluno não encontrado!";
    }
}

// Lógica de pesquisa
$search_query = "";
if (isset($_POST['search'])) {
    $search_query = $_POST['search'];
}

$sql = "SELECT a.id, a.nome, a.email, a.matricula, a.foto, 
        i.alergia, i.ja_reprovou, i.interno, i.orientador_amostra_ciencias
        FROM alunos a
        LEFT JOIN informacoes_adicionais i ON a.id = i.aluno_id
        WHERE a.nome LIKE ?";
$stmt = $conn->prepare($sql);
$search_like = "%" . $search_query . "%";
$stmt->bind_param("s", $search_like);
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Alunos - Setor</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Custom header with logo */
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between; /* Garantir que a logo e o título fiquem nas extremidades */
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .logo {
            height: 80px;
            object-fit: cover;
        }

        .header h1 {
            font-size: 28px;
            color: #28a745; /* Green color */
            margin: 0; /* Remove any margin by default */
            padding-right: 20px; /* Adiciona algum espaçamento da borda da tela */
            text-align: right; /* Alinha o título à direita */
        }

        /* Main content area */
        .main-content {
            flex: 1;
            padding: 20px;
            background-color: white;
            overflow-y: auto;
            position: relative;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }

        .alert-danger {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }

        /* Botão de sair */
        .btn {
            margin-left: auto;  /* Faz o botão ir para a direita */
        }

        .search-bar {
            max-width: 500px; /* Define a largura da barra de pesquisa */
            margin: 0 auto;  /* Centraliza a barra de pesquisa */
            margin-bottom: 20px;
        }

        .input-group input {
            width: 100%; /* Faz o campo de pesquisa preencher o container */
        }
    </style>
</head>
<body>

    <!-- Header with Logo and Logout Button -->
    <div class="header">
        <div>
            <img src="iffarpng.png" alt="Logo" class="logo">
        </div>
        <h1>Bem-vindo ao painel dos Setores</h1>
        <a href="logout.php" class="btn btn-danger">Sair</a> <!-- Botão de logout -->
    </div>

    <div class="container mt-4">
        <!-- Barra de pesquisa -->
        <form method="POST" class="search-bar">
            <div class="input-group">
                <input type="text" class="form-control" name="search" placeholder="Pesquisar aluno..." value="<?php echo $search_query; ?>">
                <button type="submit" class="btn btn-primary">Buscar</button>
            </div>
        </form>

        <!-- Display messages -->
        <?php if (isset($_SESSION['mensagem_sucesso'])) { ?>
            <div class="alert alert-success">
                <?php echo $_SESSION['mensagem_sucesso']; ?>
            </div>
            <?php unset($_SESSION['mensagem_sucesso']); ?>
        <?php } ?>

        <?php if (isset($_SESSION['mensagem_erro'])) { ?>
            <div class="alert alert-danger">
                <?php echo $_SESSION['mensagem_erro']; ?>
            </div>
            <?php unset($_SESSION['mensagem_erro']); ?>
        <?php } ?>

        <!-- Form to update student information -->
        <form method="POST">
            <table class="table table-bordered">
                <thead class="table-success">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Matricula</th>
                        <th>Foto</th>
                        <th>Alergia</th>
                        <th>Já Reprovou?</th>
                        <th>Interno?</th>
                        <th>Orientador Mostra Ciências</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()) { ?>
                        <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><input type="text" name="nome[]" value="<?php echo $row['nome']; ?>" disabled class="form-control"></td>
                            <td><input type="email" name="email[]" value="<?php echo $row['email']; ?>" disabled class="form-control"></td>
                            <td><input type="text" name="matricula[]" value="<?php echo $row['matricula']; ?>" disabled class="form-control"></td>
                            <td>
                                <?php 
                                if ($row['foto'] && file_exists('alunosfotos/' . $row['foto'])) { ?>
                                    <img src="alunosfotos/<?php echo $row['foto']; ?>" width="50" height="50">
                                <?php } else { ?>
                                    <img src="alunosfotos/default-image.jpg" width="50" height="50">
                                <?php } ?>
                            </td>
                            <td><input type="text" name="alergia[<?php echo $row['id']; ?>]" value="<?php echo $row['alergia']; ?>" class="form-control"></td>
                            <td><input type="text" name="ja_reprovou[<?php echo $row['id']; ?>]" value="<?php echo $row['ja_reprovou']; ?>" class="form-control"></td>
                            <td><input type="text" name="interno[<?php echo $row['id']; ?>]" value="<?php echo $row['interno']; ?>" class="form-control"></td>
                            <td><input type="text" name="orientador_amostra_ciencias[<?php echo $row['id']; ?>]" value="<?php echo $row['orientador_amostra_ciencias']; ?>" class="form-control"></td>
                            <input type="hidden" name="id[<?php echo $row['id']; ?>]" value="<?php echo $row['id']; ?>">
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
            <button type="submit" name="update_setor" class="btn btn-success">Salvar Todos</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

<?php
$conn->close();
?>
