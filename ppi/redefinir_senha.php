<?php
require 'conexao.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $token = $_POST['token'];
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];

    if ($new_password === $confirm_password) {
        $query = "SELECT * FROM usuarios WHERE reset_token = :token AND reset_expires > NOW()";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':token', $token);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $new_password_hash = password_hash($new_password, PASSWORD_BCRYPT);

            $query = "UPDATE usuarios SET password_hash = :new_password_hash, reset_token = NULL, reset_expires = NULL WHERE reset_token = :token";
            $stmt = $pdo->prepare($query);
            $stmt->bindParam(':new_password_hash', $new_password_hash);
            $stmt->bindParam(':token', $token);
            $stmt->execute();

            echo "Senha redefinida com sucesso!";
        } else {
            echo "Token inválido ou expirado.";
        }
    } else {
        echo "As senhas não correspondem.";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redefinir Senha - Sisgna</title>
</head>
<body>
    <h2>Redefinir Senha</h2>
    <form method="post">
        <input type="hidden" name="token" value="<?php echo $_GET['token']; ?>">
        <label>Nova Senha:</label><br>
        <input type="password" name="new_password" required><br><br>
        <label>Confirme a Nova Senha:</label><br>
        <input type="password" name="confirm_password" required><br><br>
        <button type="submit">Redefinir</button>
    </form>
</body>
</html>
