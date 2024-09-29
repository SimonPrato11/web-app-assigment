<?php
session_start();
require 'server.php'; 

// Check if the user is logged in
if (!isset($_POST['user_id']) || !isset($_POST['recipe_id'])) {
    echo "Invalid request.";
    exit();
}

$user_id = $_POST['user_id'];
$recipe_id = $_POST['recipe_id'];

// Check if the recipe is already in the user's favorites
$query_check = "SELECT * FROM favorite_recipes WHERE user_id = ? AND recipe_id = ?";
$stmt = mysqli_prepare($conn, $query_check);
mysqli_stmt_bind_param($stmt, "ii", $user_id, $recipe_id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

if (mysqli_num_rows($result) > 0) {
    echo "Recipe is already in your favorites.";
} else {
    // Insert into favorite_recipes table
    $query_insert = "INSERT INTO favorite_recipes (user_id, recipe_id) VALUES (?, ?)";
    $stmt = mysqli_prepare($conn, $query_insert);
    mysqli_stmt_bind_param($stmt, "ii", $user_id, $recipe_id);
    if (mysqli_stmt_execute($stmt)) {
        echo "Recipe saved to favorites!";
    } else {
        echo "Failed to save recipe to favorites.";
    }
}
?>
