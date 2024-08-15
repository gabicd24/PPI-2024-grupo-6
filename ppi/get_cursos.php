<?php
// Configurações de conexão com o banco de dados
$servername = "localhost";
$username = "root"; // Substitua pelo seu usuário
$password = ""; // Substitua pela sua senha
$dbname = "sisgna"; // Substitua pelo nome do seu banco de dados

// Cria conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Consulta para obter os cursos
$sql = "SELECT id, nome FROM cursos"; // Substitua 'cursos' pelo nome correto da tabela
$result = $conn->query($sql);

$cursos = [];

if ($result->num_rows > 0) {
    // Preenche o array com os cursos
    while ($row = $result->fetch_assoc()) {
        $cursos[] = $row;
    }
}

// Fecha a conexão
$conn->close();

// Retorna os cursos como JSON
header('Content-Type: application/json');
echo json_encode($cursos);
?>
