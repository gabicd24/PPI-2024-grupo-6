<?php
$host = 'localhost';
$db = 'sisgna'; // Nome do banco de dados
$user = 'root'; // Usuário padrão do XAMPP
$pass = ''; // Senha padrão do XAMPP

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo 'Conexão falhou: ' . $e->getMessage();
}
?>
