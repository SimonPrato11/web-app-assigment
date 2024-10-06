<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

require 'server.php'; 

$user_id = $_SESSION['user_id']; 

$recipes = [];
$favorites = [];
$ratings = [];

// Query to get the user's favorite recipes
$favorites_query = "SELECT recipe_id FROM favorite_recipes WHERE user_id = ?";
$stmt_favorites = mysqli_prepare($conn, $favorites_query);
mysqli_stmt_bind_param($stmt_favorites, "i", $user_id);
mysqli_stmt_execute($stmt_favorites);
$result_favorites = mysqli_stmt_get_result($stmt_favorites);

if (mysqli_num_rows($result_favorites) > 0) {
    while ($row = mysqli_fetch_assoc($result_favorites)) {
        $favorites[] = $row['recipe_id']; 
    }
}

// Query to get the average taste rating for each recipe
$ratings_query = "SELECT recipe_id, AVG(taste_rating) as avg_taste_rating 
                  FROM ratings 
                  GROUP BY recipe_id";
$result_ratings = mysqli_query($conn, $ratings_query);

if (mysqli_num_rows($result_ratings) > 0) {
    while ($row = mysqli_fetch_assoc($result_ratings)) {
        $ratings[$row['recipe_id']] = round($row['avg_taste_rating'], 1); 
    }
}

// Handle the search request and filters
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $conditions = [];

    // Check if search query is provided
    if (isset($_GET['search']) && !empty(trim($_GET['search']))) {
        $search_query = mysqli_real_escape_string($conn, $_GET['search']);
        $conditions[] = "r.title LIKE '%$search_query%'";
    }

    // Check if ingredient filter is provided
    if (isset($_GET['ingredient']) && !empty(trim($_GET['ingredient']))) {
        $ingredient_query = mysqli_real_escape_string($conn, $_GET['ingredient']);
        $conditions[] = "i.ingredient_name LIKE '%$ingredient_query%'";
    }

    // Check if category filter is provided
    if (isset($_GET['category']) && !empty($_GET['category'])) {
        $category_query = mysqli_real_escape_string($conn, $_GET['category']);
        $conditions[] = "r.category = '$category_query'";
    }

    // Check if cook time filter is provided
    if (isset($_GET['cook_time']) && !empty($_GET['cook_time'])) {
        $cook_time_query = (int)$_GET['cook_time'];
        $conditions[] = "r.cook_time <= $cook_time_query";
    }

    // Build the query
    $query = "SELECT DISTINCT r.* FROM recipes r 
              LEFT JOIN ingredients i ON r.recipe_id = i.recipe_id";
              
    if (count($conditions) > 0) {
        $query .= " WHERE " . implode(" AND ", $conditions);
    }

    $query .= " ORDER BY r.title ASC";

    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $recipes[] = $row;
        }
    }

    // Send the results as a JSON response
    echo json_encode([
        'recipes' => $recipes,
        'favorites' => $favorites,
        'ratings' => $ratings,
    ]);
}
