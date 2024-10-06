CREATE DATABASE recipe_app;
USE recipe_app;

-- User table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Recipe table
CREATE TABLE recipes (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    prep_time INT, -- in minutes
    cook_time INT, -- in minutes
    category VARCHAR(50), -- e.g., "main", "vegetarian"
    servings INT
);

-- Ingredients table
CREATE TABLE ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT, -- Foreign key to the recipes table
    ingredient_name VARCHAR(255) NOT NULL,
    quantity VARCHAR(100) NOT NULL, -- e.g., "2 tbsp", "1 x 400g tin"
    instructions VARCHAR(255), -- e.g., "very thinly sliced", "chopped"
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

-- Favorite recipes table
CREATE TABLE favorite_recipes (
    favorite_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    recipe_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

-- Methods table
CREATE TABLE methods (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT, -- Foreign key to the recipes table
    step_number INT NOT NULL,
    step_description TEXT NOT NULL, -- Description of the step
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

-- Ratings table
CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, -- Foreign key to the users table
    recipe_id INT, -- Foreign key to the recipes table
    taste_rating INT CHECK (taste_rating BETWEEN 1 AND 5),
    difficulty_rating INT CHECK (difficulty_rating BETWEEN 1 AND 5),
    aesthetics_rating INT CHECK (aesthetics_rating BETWEEN 1 AND 5),
    overall_rating FLOAT, -- We'll need to calculate this value manually
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id) ON DELETE CASCADE
);
