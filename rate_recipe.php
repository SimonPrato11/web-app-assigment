<?php
session_start();
require 'server.php';

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['error' => 'User not logged in']);
    exit();
}

// Proceed if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_SESSION['user_id']; // Use session to get the logged-in user ID
    $recipe_id = (int) $_POST['recipe_id'];
    $taste_rating = (int) $_POST['taste_rating'];

    // Validate rating input (assuming rating is between 1 and 5)
    if ($taste_rating < 1 || $taste_rating > 5) {
        echo json_encode(['error' => 'Invalid rating value']);
        exit();
    }

    // Check if the user already rated the recipe
    $check_query = "SELECT * FROM ratings WHERE user_id = ? AND recipe_id = ?";
    $stmt = mysqli_prepare($conn, $check_query);
    mysqli_stmt_bind_param($stmt, "ii", $user_id, $recipe_id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) > 0) {
        // Update the existing rating
        $update_query = "UPDATE ratings SET taste_rating = ? WHERE user_id = ? AND recipe_id = ?";
        $stmt_update = mysqli_prepare($conn, $update_query);
        if ($stmt_update === false) {
            echo json_encode(['error' => 'Database error during rating update']);
            exit();
        }
        mysqli_stmt_bind_param($stmt_update, "iii", $taste_rating, $user_id, $recipe_id);
        mysqli_stmt_execute($stmt_update);
    } else {
        // Insert a new rating
        $insert_query = "INSERT INTO ratings (user_id, recipe_id, taste_rating) VALUES (?, ?, ?)";
        $stmt_insert = mysqli_prepare($conn, $insert_query);
        if ($stmt_insert === false) {
            echo json_encode(['error' => 'Database error during rating insert']);
            exit();
        }
        mysqli_stmt_bind_param($stmt_insert, "iii", $user_id, $recipe_id, $taste_rating);
        mysqli_stmt_execute($stmt_insert);
    }

    // Calculate the updated average taste rating for the recipe
    $avg_query = "SELECT AVG(taste_rating) as avg_taste_rating FROM ratings WHERE recipe_id = ?";
    $stmt_avg = mysqli_prepare($conn, $avg_query);
    if ($stmt_avg === false) {
        echo json_encode(['error' => 'Database error during average rating calculation']);
        exit();
    }
    mysqli_stmt_bind_param($stmt_avg, "i", $recipe_id);
    mysqli_stmt_execute($stmt_avg);
    $result_avg = mysqli_stmt_get_result($stmt_avg);
    $avg_rating = mysqli_fetch_assoc($result_avg)['avg_taste_rating'];

    // Return the updated average rating as a JSON response
    echo json_encode(['avg_rating' => round($avg_rating, 1)]);
}
?>
