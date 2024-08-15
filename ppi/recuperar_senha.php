<?php
require 'conexao.php'; // Certifique-se de que o arquivo de conexão com o banco de dados está correto

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];

    $query = "SELECT * FROM usuarios WHERE email = :email";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $new_password = bin2hex(random_bytes(4)); // Gera uma nova senha aleatória
        $new_password_hash = password_hash($new_password, PASSWORD_BCRYPT);

        $query = "UPDATE usuarios SET password_hash = :new_password_hash WHERE email = :email";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':new_password_hash', $new_password_hash);
        $stmt->bindParam(':email', $email);
        $stmt->execute();

        // Configurações do e-mail
        $to = $email;
        $subject = 'Recuperação de Senha - Sisgna';
        $message = "Sua nova senha é: $new_password";
        $headers = "From: lorenzorpiovesan@hotmail.com";

        // Enviar o e-mail
        if (mail($to, $subject, $message, $headers)) {
            echo 'Uma nova senha foi enviada para seu e-mail.';
        } else {
            echo 'Falha ao enviar e-mail.';
        }
    } else {
        echo "E-mail não encontrado.";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Senha - Sisgna</title>
</head>
<body>
    <h2>Recuperar Senha</h2>
    <form method="post">
        <label>E-mail:</label><br>
        <input type="email" name="email" required><br><br>
        <button type="submit">Enviar</button>
    </form>
</body>
</html>
