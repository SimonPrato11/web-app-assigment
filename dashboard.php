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

$search_query = "";
$ingredient_query = "";
$category_query = "";
$cook_time_query = "";
$recipes = [];
$favorites = [];

// Query to get the user's favorite recipes
$favorites_query = "SELECT recipe_id FROM favorite_recipes WHERE user_id = ?";
$stmt_favorites = mysqli_prepare($conn, $favorites_query);
mysqli_stmt_bind_param($stmt_favorites, "i", $user_id);
mysqli_stmt_execute($stmt_favorites);
$result_favorites = mysqli_stmt_get_result($stmt_favorites);

if (mysqli_num_rows($result_favorites) > 0) {
    while ($row = mysqli_fetch_assoc($result_favorites)) {
        $favorites[] = $row['recipe_id']; // Store favorite recipe IDs
    }
}

// Query to get the average taste rating for each recipe
$ratings_query = "SELECT recipe_id, AVG(taste_rating) as avg_taste_rating 
                  FROM ratings 
                  GROUP BY recipe_id";
$result_ratings = mysqli_query($conn, $ratings_query);

if (mysqli_num_rows($result_ratings) > 0) {
    while ($row = mysqli_fetch_assoc($result_ratings)) {
        $ratings[$row['recipe_id']] = round($row['avg_taste_rating'], 1); // Store average rating, rounded to 1 decimal
}

}

// Handle the search request and filters
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $conditions = [];

    // Search by recipe title
    if (isset($_GET['search']) && !empty($_GET['search'])) {
        $search_query = mysqli_real_escape_string($conn, $_GET['search']);
        $conditions[] = "r.title LIKE '%$search_query%'";
    }

    // Search by ingredient
    if (isset($_GET['ingredient']) && !empty($_GET['ingredient'])) {
        $ingredient_query = mysqli_real_escape_string($conn, $_GET['ingredient']);
        $conditions[] = "i.ingredient_name LIKE '%$ingredient_query%'";
    }

    // Filter by category
    if (isset($_GET['category']) && !empty($_GET['category'])) {
        $category_query = mysqli_real_escape_string($conn, $_GET['category']);
        $conditions[] = "r.category = '$category_query'";
    }

    // Filter by cook time
    if (isset($_GET['cook_time']) && !empty($_GET['cook_time'])) {
        $cook_time_query = (int)$_GET['cook_time'];
        $conditions[] = "r.cook_time <= $cook_time_query";
    }

    // Build the query based on conditions
    $query = "SELECT DISTINCT r.* FROM recipes r 
              LEFT JOIN ingredients i ON r.recipe_id = i.recipe_id";
    if (count($conditions) > 0) {
        $query .= " WHERE " . implode(" AND ", $conditions);
    }

    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $recipes[] = $row;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Include jQuery for AJAX -->
</head>
<body>
    <h1>Welcome, <?php echo htmlspecialchars($_SESSION['name']); ?>!</h1>
    <p>Your email: <?php echo htmlspecialchars($_SESSION['email']); ?></p>
    <a href="logout.php">Logout</a>

    <!-- Recipes Section -->
    <h2>Recipes</h2>
    

    <!-- Search and Filter Form -->
         <!-- Add the View Saved Recipes button here -->
    <a href="saved_recipes.php">
        <button>View Saved Recipes</button>
    </a>
    
    <form action="dashboard.php" method="GET">
        <!-- Search by recipe title -->
        <label for="search">Search Recipes:</label>
        <input type="text" id="search" name="search" placeholder="Enter recipe name..." value="<?php echo htmlspecialchars($search_query); ?>" />

        <!-- Filter by ingredient -->
        <label for="ingredient">Ingredient:</label>
        <input type="text" id="ingredient" name="ingredient" placeholder="Enter ingredient..." value="<?php echo htmlspecialchars($ingredient_query); ?>" />

        <!-- Filter by category -->
        <label for="category">Category:</label>
        <select name="category" id="category">
            <option value="">All Categories</option>
            <option value="Main" <?php echo $category_query === 'Main' ? 'selected' : ''; ?>>Main</option>
            <option value="Dessert" <?php echo $category_query === 'Dessert' ? 'selected' : ''; ?>>Dessert</option>
            <option value="Starter" <?php echo $category_query === 'Starter' ? 'selected' : ''; ?>>Starter</option>
        </select>

        <!-- Filter by cook time -->
        <label for="cook_time">Cook Time:</label>
        <select name="cook_time" id="cook_time">
            <option value="">Any</option>
            <option value="30" <?php echo $cook_time_query == 30 ? 'selected' : ''; ?>>Under 30 minutes</option>
            <option value="60" <?php echo $cook_time_query == 60 ? 'selected' : ''; ?>>Under 60 minutes</option>
            <option value="120" <?php echo $cook_time_query == 120 ? 'selected' : ''; ?>>Under 120 minutes</option>
        </select>

        <button type="submit">Search</button>
    </form>

    <!-- Displaying search results -->
    <div id="results">
        <?php if (count($recipes) > 0): ?>
            <ul>
                <?php foreach ($recipes as $recipe): ?>
                    <li>
                        <strong><?php echo htmlspecialchars($recipe['title']); ?></strong>
                        <p><?php echo htmlspecialchars($recipe['description']); ?></p>
                        <p><strong>Category:</strong> <?php echo htmlspecialchars($recipe['category']); ?></p>
                        <p><strong>Prep Time:</strong> <?php echo htmlspecialchars($recipe['prep_time']); ?> minutes</p>
                        <p><strong>Cook Time:</strong> <?php echo htmlspecialchars($recipe['cook_time']); ?> minutes</p>
                        <p><strong>Servings:</strong> <?php echo htmlspecialchars($recipe['servings']); ?></p>
                        
                          <!-- Display Taste Rating -->
                        <p>
                            <strong>Taste Rating:</strong>
                            <span class="stars-container">
                                <?php 
                                // Check if the recipe has a rating
                                $avg_rating = isset($ratings[$recipe['recipe_id']]) ? $ratings[$recipe['recipe_id']] : 0; 
                                
                                // Display the stars based on the average rating
                                for ($i = 1; $i <= 5; $i++) {
                                    echo '<span class="stars ' . ($i <= $avg_rating ? 'selected' : '') . '" data-value="' . $i . '" data-recipe-id="' . $recipe['recipe_id'] . '">&#9733;</span>';
                                }
                                ?>
                            </span> (<?php echo $avg_rating; ?>/5)
                        </p>
                        
                        <!-- Save to Favorites button -->
                        <?php if (in_array($recipe['recipe_id'], $favorites)): ?>
                            <!-- If recipe is already a favorite -->
                            <button class="favorite-btn" data-recipe-id="<?php echo $recipe['recipe_id']; ?>" disabled>Saved</button>
                        <?php else: ?>
                            <!-- If recipe is not yet a favorite -->
                            <button class="favorite-btn" data-recipe-id="<?php echo $recipe['recipe_id']; ?>">Save to Favorites</button>
                        <?php endif; ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <p>No recipes found matching your search criteria.</p>
        <?php endif; ?>
    </div>

   <!-- JavaScript for handling rating and favorite actions -->
    <script>
        // Handle rating click event
        $(document).on('click', '.stars', function() {
            var rating = $(this).data('value');
            var recipe_id = $(this).data('recipe-id');
            var user_id = <?php echo $_SESSION['user_id']; ?>;

            // Send rating to server via AJAX
            $.ajax({
                url: 'rate_recipe.php',
                method: 'POST',
                data: { recipe_id: recipe_id, user_id: user_id, taste_rating: rating },
                success: function(response) {
                    alert(response); // Notify the user
                    // Optionally refresh the page to show updated average rating
                },
                error: function() {
                    alert('An error occurred while rating the recipe.');
                }
            });
        });

        // Handle save to favorites
        $(document).on('click', '.favorite-btn', function() {
            var button = $(this);
            var recipe_id = button.data('recipe-id');
            var user_id = <?php echo $_SESSION['user_id']; ?>;

            $.ajax({
                url: 'save_favorite.php',
                method: 'POST',
                data: { recipe_id: recipe_id, user_id: user_id },
                success: function(response) {
                    if (response.trim() === "Recipe saved to favorites!") {
                        button.text('Saved');
                        button.prop('disabled', true);
                    } else {
                        alert(response);
                    }
                },
                error: function() {
                    alert('An error occurred while saving to favorites.');
                }
            });
        });
    </script>
</body>
</html>
