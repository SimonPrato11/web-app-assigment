<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Include the database connection
require 'server.php'; // Make sure this connects to your database

$user_id = $_SESSION['user_id']; // Get the logged-in user's ID
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
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saved Recipes</title>
</head>
<body>
    <h1>Your Saved Recipes</h1>

    <?php if (count($saved_recipes) > 0): ?>
        <ul>
            <?php foreach ($saved_recipes as $recipe): ?>
                <li>
                    <strong><?php echo htmlspecialchars($recipe['title']); ?></strong>
                    <p><?php echo htmlspecialchars($recipe['description']); ?></p>
                    <p><strong>Category:</strong> <?php echo htmlspecialchars($recipe['category']); ?></p>
                    <p><strong>Prep Time:</strong> <?php echo htmlspecialchars($recipe['prep_time']); ?> minutes</p>
                    <p><strong>Cook Time:</strong> <?php echo htmlspecialchars($recipe['cook_time']); ?> minutes</p>
                    <p><strong>Servings:</strong> <?php echo htmlspecialchars($recipe['servings']); ?></p>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php else: ?>
        <p>No recipes saved yet.</p>
    <?php endif; ?>

    <!-- Back to Dashboard button -->
    <a href="dashboard.php">
        <button>Back to Dashboard</button>
    </a>
</body>
</html>
