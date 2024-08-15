<?php
// Incluir o arquivo de configuração ou conexão com o banco de dados
include 'conexao.php'; // Substitua pelo caminho correto para sua configuração de banco de dados

// Verificar se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Receber dados do formulário
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $cpf = $_POST['cpf'];
    $senha = password_hash($_POST['senha'], PASSWORD_BCRYPT); // Criptografar a senha
    $disciplinas = isset($_POST['disciplinas']) ? $_POST['disciplinas'] : []; // Disciplinas selecionadas

    // Verificar se há uma foto e processá-la
    if (isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
        $foto = $_FILES['foto']['name'];
        $fotoTmp = $_FILES['foto']['tmp_name'];
        $fotoDest = 'caminho/para/fotos/' . $foto; // Substitua pelo caminho correto para salvar a foto
        move_uploaded_file($fotoTmp, $fotoDest);
    } else {
        $foto = null; // Ou definir um valor padrão
    }

    // Inserir professor no banco de dados
    $stmt = $pdo->prepare("INSERT INTO professores (nome, email, cpf, senha, foto) VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([$nome, $email, $cpf, $senha, $foto]);

    // Obter o ID do professor inserido
    $professor_id = $pdo->lastInsertId();

    // Associar disciplinas ao professor
    if (!empty($disciplinas)) {
        $stmt = $pdo->prepare("INSERT INTO professor_disciplinas (professor_id, disciplina_id) VALUES (?, ?)");
        foreach ($disciplinas as $disciplina_id) {
            $stmt->execute([$professor_id, $disciplina_id]);
        }
    }

    // Redirecionar ou exibir uma mensagem de sucesso
    header('Location: sucesso.php'); // Substitua pelo URL da página de sucesso
    exit();
} else {
    // Redirecionar para a página de cadastro se a solicitação não for POST
    header('Location: cadastro_professor.php'); // Substitua pelo URL da página de cadastro
    exit();
}
?>
