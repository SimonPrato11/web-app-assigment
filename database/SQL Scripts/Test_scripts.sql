SELECT ingredient_name, quantity, instructions, ingredient_section
FROM ingredients
WHERE recipe_id = 1
ORDER BY ingredient_section;

SELECT * from recipes;
SELECT * from methods;
SELECT * from ingredients;


SELECT * FROM recipes WHERE title = 'Mango Pie';

SHOW Tables;

SELECT * FROM recipes WHERE recipe_id = 1;

SELECT * from methods where recipe_id = 8
ORDER BY step_number;

SELECT * from methods where method_id = 1;


-- Retrieve all recipes to verify correct insertion
SELECT * FROM recipes;

-- Count total recipes
SELECT COUNT(*) AS total_recipes FROM recipes;

-- Check details of a specific recipe
SELECT * FROM recipes WHERE title = 'Vegan Pancakes';

-- Retrieve all ingredients for a specific recipe
SELECT * FROM ingredients WHERE recipe_id = 1; 

-- Count ingredients for a specific recipe
SELECT COUNT(*) AS total_ingredients FROM ingredients WHERE recipe_id = 1;

-- Check if a specific ingredient is present
SELECT * FROM ingredients WHERE ingredient_name = 'Onion' AND recipe_id = 1;

TRUNCATE TABLE recipes;

SELECT 
    TABLE_NAME, 
    CONSTRAINT_NAME, 
    REFERENCED_TABLE_NAME 
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE 
    REFERENCED_TABLE_NAME = 'recipes';

SET SQL_SAFE_UPDATES = 1;

DELETE FROM methods;
DELETE FROM ingredients;
DELETE FROM recipes;


UPDATE recipes
SET recipe_id = 8
WHERE recipe_id = 19;

-- Retrieve all ingredients for a specific recipe
SELECT * FROM ingredients WHERE recipe_id = 8;

-- Count ingredients for a specific recipe
SELECT COUNT(*) AS total_ingredients FROM ingredients WHERE recipe_id = 6;

-- Check if a specific ingredient is present
SELECT * FROM ingredients WHERE ingredient_name = 'baking powder' AND recipe_id = 7;

