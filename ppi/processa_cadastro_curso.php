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
$descricao = isset($_POST['descricao']) ? $_POST['descricao'] : '';

if (empty($nome) || empty($descricao)) {
    die("Nome e descrição são obrigatórios.");
}

$sql = "INSERT INTO cursos (nome, descricao) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
if ($stmt === false) {
    die("Erro na preparação da declaração: " . $conn->error);
}
$stmt->bind_param("ss", $nome, $descricao);
if ($stmt->execute()) {
    echo "Curso cadastrado com sucesso.";
} else {
    echo "Erro ao cadastrar o curso: " . $stmt->error;
}
$stmt->close();
$conn->close();
?>
