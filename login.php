<?php
session_start();
require 'server.php'; // Include your DB connection

// Enable error reporting for debugging purposes (remove in production)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Check if the form is submitted
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
            // Invalid password
            echo "Invalid password!";
        }
    } else {
        // No user found with that email
        echo "No user found with that email!";
    }
} else {
    // Redirect to login form if accessed directly without POST
    header('Location: login.html');
    exit();
}
?>
