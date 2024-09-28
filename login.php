<?php
session_start();
require 'server.php'; // Include your DB connection

// Enable error reporting for debugging purposes (remove in production)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$error_message = ""; // To store error messages

// Process form submission if the request method is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // Query to fetch the user based on the submitted email
    $query = "SELECT * FROM users WHERE email = '$email' LIMIT 1";
    $result = mysqli_query($conn, $query);

    // Check if the user exists
    if (mysqli_num_rows($result) == 1) {
        $user = mysqli_fetch_assoc($result);

        // Verify the password
        if (password_verify($password, $user['password'])) {
            // Password is correct, set session variables
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['name'] = $user['name'];
            $_SESSION['email'] = $user['email'];

            // Redirect to a protected page (e.g., dashboard.php)
            header('Location: dashboard.php');
            exit();
        } else {
            // Incorrect password
            $error_message = "Invalid email or password!";
        }
    } else {
        // No user found with that email
        $error_message = "Invalid email or password!";
    }
}
?>

<!-- Display the login form and show errors if there are any -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>

    <!-- Display error message if there's any -->
    <?php if (!empty($error_message)): ?>
        <div style="color: red;">
            <?php echo htmlspecialchars($error_message); ?>
        </div>
    <?php endif; ?>

    <!-- Login form -->
    <form action="login.php" method="POST">
        <label for="email">Email:</label>
        <input type="email" name="email" required><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br>

        <button type="submit">Login</button>
    </form>

    <br>
    <!-- Button to go to registration page -->
    <form action="registration.html">
        <button type="submit">Go to Registration</button>
    </form>
</body>
</html>
