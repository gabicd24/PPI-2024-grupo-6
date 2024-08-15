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
$email = isset($_POST['email']) ? $_POST['email'] : '';
$senha = isset($_POST['senha']) ? $_POST['senha'] : '';
$setor = isset($_POST['setor']) ? $_POST['setor'] : '';

if (empty($email) || empty($senha) || empty($setor)) {
    die("Todos os campos são obrigatórios.");
}

$foto = '';
if (isset($_FILES['foto']) && $_FILES['foto']['error'] == UPLOAD_ERR_OK) {
    $upload_dir = 'imagens/';
    $upload_file = $upload_dir . basename($_FILES['foto']['name']);
    if (move_uploaded_file($_FILES['foto']['tmp_name'], $upload_file)) {
        $foto = basename($_FILES['foto']['name']);
    } else {
        die("Falha ao fazer upload da foto.");
    }
}

$sql = "INSERT INTO setores (email, senha, setor, foto) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
if ($stmt === false) {
    die("Erro na preparação da declaração: " . $conn->error);
}
$stmt->bind_param("ssss", $email, $senha, $setor, $foto);
if ($stmt->execute()) {
    echo "Setor cadastrado com sucesso.";
} else {
    echo "Erro ao cadastrar o setor: " . $stmt->error;
}
$stmt->close();
$conn->close();
?>
