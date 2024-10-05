<?php
session_start();
require 'server.php'; 

header('Content-Type: application/json'); // Return JSON

// Initialize an empty array to store error messages
$error_message = "";

// Process form submission
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

            // Return success response with user data
            echo json_encode([
                'success' => true,
                'user_id' => $user['user_id'],
                'name' => $user['name'],
                'email' => $user['email']
            ]);
            exit();
        } else {
            // Incorrect password
            $error_message = "Invalid email or password!";
        }
    } else {
        // No user found with that email
        $error_message = "Invalid email or password!";
    }

    // If errors, return them as JSON
    echo json_encode(['success' => false, 'message' => $error_message]);
    exit();
}
