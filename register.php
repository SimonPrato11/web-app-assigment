<?php
session_start();
require 'server.php'; 

header('Content-Type: application/json'); // Set the header to return JSON
$errors = [];

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // Validate the password 
    if (strlen($password) < 6 || !preg_match('/[A-Za-z]/', $password) || !preg_match('/[0-9]/', $password)) {
        $errors[] = "Password must be at least 6 characters long and contain both letters and numbers.";
    }

    // Check if the email already exists
    $check_email_query = "SELECT * FROM users WHERE email = '$email' LIMIT 1";
    $result = mysqli_query($conn, $check_email_query);

    if (mysqli_num_rows($result) > 0) {
        $errors[] = "This email is already registered. Please use a different email or log in.";
    }

    // If no errors, proceed with registration
    if (count($errors) == 0) {
        // Hash the password before storing it
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // Insert the new user into the database
        $query = "INSERT INTO users (name, email, password) VALUES ('$name', '$email', '$hashed_password')";

        if (mysqli_query($conn, $query)) {
            // Return success as JSON
            echo json_encode(['success' => true]);
            exit();
        } else {
            $errors[] = "Registration failed: " . mysqli_error($conn);
        }
    }

    // Return errors as JSON if any exist
    echo json_encode(['success' => false, 'errors' => $errors]);
    exit();
}
?>
