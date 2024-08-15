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
$tipo_setor = isset($_POST['tipo_setor']) ? $_POST['tipo_setor'] : '';
$senha = isset($_POST['senha']) ? $_POST['senha'] : '';

if (empty($nome) || empty($tipo_setor) || empty($senha)) {
    die("Nome, tipo de setor e senha são obrigatórios.");
}

// Hash da senha para segurança
$senha_hash = password_hash($senha, PASSWORD_BCRYPT);

// Prepara a consulta SQL para inserir os dados na tabela setores
$sql = "INSERT INTO setores (nome, tipo_setor, senha) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);

if ($stmt === false) {
    die("Erro na preparação da declaração: " . $conn->error);
}

$stmt->bind_param("sss", $nome, $tipo_setor, $senha_hash);

if ($stmt->execute()) {
    echo "Setor cadastrado com sucesso.";
} else {
    echo "Erro ao cadastrar o setor: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
