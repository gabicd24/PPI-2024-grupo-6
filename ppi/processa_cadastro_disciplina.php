<?php
// Configurações do banco de dados
$host = 'localhost';
$user = 'root'; // Substitua pelo nome de usuário do MySQL
$pass = ''; // Substitua pela senha do MySQL
$db   = 'sisgna'; // Nome do banco de dados

// Conectar ao banco de dados
$conn = new mysqli($host, $user, $pass, $db);

// Verifica a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Processa o formulário
$nome = isset($_POST['nome']) ? $_POST['nome'] : '';
$turma_id = isset($_POST['turma_id']) ? $_POST['turma_id'] : '';

if (empty($nome) || empty($turma_id)) {
    die("Nome e turma são obrigatórios.");
}

$sql = "INSERT INTO disciplinas (nome, turma_id) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
if ($stmt === false) {
    die("Erro na preparação da declaração: " . $conn->error);
}
$stmt->bind_param("si", $nome, $turma_id);
if ($stmt->execute()) {
    echo "Disciplina cadastrada com sucesso.";
} else {
    echo "Erro ao cadastrar a disciplina: " . $stmt->error;
}
$stmt->close();
$conn->close();
?>
