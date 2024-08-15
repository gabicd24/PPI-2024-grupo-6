<?php
session_start();
require 'conexao.php'; // Arquivo de conexão com o banco de dados

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Verifica se o nome de usuário está vazio
    if (empty($username) || empty($password)) {
        echo "Usuário e senha são obrigatórios.";
        exit;
    }

    // Prepara e executa a consulta para buscar o usuário pelo nome de usuário
    $query = "SELECT * FROM usuarios WHERE username = :username";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':username', $username);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Verifica se o usuário foi encontrado e se a senha corresponde ao hash armazenado
    if ($user && password_verify($password, $user['password_hash'])) {
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        header("Location: admin.php");
        exit;
    } else {
        echo "Usuário ou senha inválidos.";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sisgna</title>
</head>
<body>
    <h2>Login</h2>
    <form method="post">
        <label>Usuário:</label><br>
        <input type="text" name="username" required><br><br>
        <label>Senha:</label><br>
        <input type="password" name="password" required><br><br>
        <button type="submit">Entrar</button>
    </form>
</body>
</html>
<?php
$password = '2504';
$hashed_password = password_hash($password, PASSWORD_BCRYPT);
echo $hashed_password;
?>
