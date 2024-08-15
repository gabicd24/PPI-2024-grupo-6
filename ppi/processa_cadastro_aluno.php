<?php
// Conexão com o banco de dados
$conn = new mysqli('localhost', 'root', '', 'sisgna');

if ($conn->connect_error) {
    die('Erro de conexão: ' . $conn->connect_error);
}

// Verifica se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['foto'])) {
    // Dados do aluno
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $cpf = $_POST['cpf'];
    $matricula = $_POST['matricula'];
    $turma_id = $_POST['turma_id'];

    // Processo de upload da foto
    $foto = $_FILES['foto'];
    $fotoNome = time() . '_' . basename($foto['name']);
    $fotoDestino = 'uploads/alunos/' . $fotoNome;

    // Cria o diretório se não existir
    if (!is_dir('uploads/alunos')) {
        mkdir('uploads/alunos', 0777, true);
    }

    if (move_uploaded_file($foto['tmp_name'], $fotoDestino)) {
        // Insere os dados no banco de dados
        $stmt = $conn->prepare("INSERT INTO alunos (nome, email, cpf, matricula, turma_id, foto) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssss", $nome, $email, $cpf, $matricula, $turma_id, $fotoNome);

        if ($stmt->execute()) {
            echo 'Aluno cadastrado com sucesso!';
        } else {
            echo 'Erro ao cadastrar o aluno: ' . $stmt->error;
        }

        $stmt->close();
    } else {
        echo 'Erro ao fazer upload da foto.';
    }
}

$conn->close();
?>
