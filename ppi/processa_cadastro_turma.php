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
$curso_id = isset($_POST['curso_id']) ? $_POST['curso_id'] : '';

if (empty($nome) || empty($curso_id)) {
    die("Nome e curso são obrigatórios.");
}

$sql = "INSERT INTO turmas (nome, curso_id) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
if ($stmt === false) {
    die("Erro na preparação da declaração: " . $conn->error);
}
$stmt->bind_param("si", $nome, $curso_id);
if ($stmt->execute()) {
    echo "Turma cadastrada com sucesso.";
} else {
    echo "Erro ao cadastrar a turma: " . $stmt->error;
}
$stmt->close();
$conn->close();
?>
