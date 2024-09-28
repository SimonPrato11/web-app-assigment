<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
session_start();

require 'server.php'; // Ensure this file contains only the DB connection code

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // Hash the password before storing it
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert into the database
    $query = "INSERT INTO users (name, email, password) VALUES ('$name', '$email', '$hashed_password')";

    if (mysqli_query($conn, $query)) {
        // If registration is successful, redirect to the login page
        header('Location: login.html');
        exit();
    } else {
        // Show error if insertion fails
        echo "Error: " . mysqli_error($conn);
    }
} else {
    // Redirect to the registration form if accessed without POST
    header('Location: registration.html');
    exit();
}
?>
