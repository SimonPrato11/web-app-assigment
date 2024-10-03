<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

require 'server.php';

$user_id = $_SESSION['user_id']; 
$saved_recipes = [];

// Query to get the user's saved recipes
$query = "SELECT r.* FROM recipes r
          INNER JOIN favorite_recipes f ON r.recipe_id = f.recipe_id
          WHERE f.user_id = ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "i", $user_id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $saved_recipes[] = $row;
    }
}

// Return the saved recipes as a JSON response
echo json_encode($saved_recipes);
?>
