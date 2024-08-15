<?php
header('Content-Type: application/json');
include('conexao.php'); // Certifique-se de incluir o arquivo de configuração

if (!isset($_GET['turma_id']) || empty($_GET['turma_id'])) {
    echo json_encode(['error' => 'ID da turma não fornecido.']);
    exit();
}

$turma_id = (int)$_GET['turma_id'];

$sql = 'SELECT * FROM disciplinas WHERE turma_id = :turma_id';
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':turma_id', $turma_id, PDO::PARAM_INT);
$stmt->execute();
$disciplinas = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($disciplinas);
?>
