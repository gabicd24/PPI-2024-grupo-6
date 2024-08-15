<?php
header('Content-Type: application/json');

// Conectar ao banco de dados
$mysqli = new mysqli("localhost", "root", "", "sisgna");

// Verificar conexão
if ($mysqli->connect_error) {
    die("Falha na conexão: " . $mysqli->connect_error);
}

// Consulta para buscar todas as turmas
$sql = "SELECT id, nome FROM turmas";
$result = $mysqli->query($sql);

if ($result->num_rows > 0) {
    $turmas = [];
    while ($row = $result->fetch_assoc()) {
        $turmas[] = $row;
    }
    echo json_encode($turmas);
} else {
    echo json_encode([]);
}

// Fechar a conexão
$mysqli->close();
?>
