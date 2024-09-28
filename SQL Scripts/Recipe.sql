CREATE TABLE recipes (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    prep_time INT, -- in minutes
    cook_time INT, -- in minutes
    category VARCHAR(50), -- e.g., "main", "vegetarian"
    servings INT
);

-- Recipe 1
INSERT INTO recipes (title, description, prep_time, cook_time, category, servings)
VALUES ('Vegan Doner Kebab', 'A plant-based take on a classic doner kebab with oyster mushrooms, cabbage, and yogurt sauce.', 30, 10, 'main', 4);

-- Recipe 2
INSERT INTO recipes (title, description, prep_time, cook_time, category, servings)
VALUES ('Mango Pie', 'This mouthwatering mango dessert is an Indian take on a traditional Thanksgiving pie.', 30, 60, 'Desert', 16);

-- Recipe 3
INSERT INTO recipes (title, description, prep_time, cook_time, category, servings)
VALUES ('Plum clafoutis', 'Halved plums are covered in a light batter and then baked in the oven to make this traditional French dessert.', 30, 60, 'Desert', 4);

UPDATE recipes SET category='Dessert'
WHERE recipe_id=3;

-- Recipe 4
INSERT INTO recipes (title, description, prep_time, cook_time, category, servings)
VALUES ('Couscous salad', 'A nutritious and satisfying vegan couscous salad packed with colour, flavour and texture, from dried cranberries, pistachios and pine nuts.', 5, 10, 'Starter', 4);

-- Recipe 5
INSERT INTO recipes (title, description, prep_time, cook_time, category, servings)
VALUES ('Easy Lamb Biryani', 'This lamb biryani is real centrepiece dish, but it is actually easy as anything to make. Serve garnished with pomegranate seeds to make it look really special', 72, 120, 'Main', 8);

-- Recipe 6
INSERT INTO recipes (title, description, prep_time, cook_time, category, servings)
VALUES ('Healthy Pizza', 'No yeast required for this easy, healthy pizza, topped with colourful vegetables that is ready in 30 minutes', 10, 30, 'Main', 2);

-- Recipe 7
INSERT INTO recipes (title, description, prep_time, cook_time, category, servings)
VALUES ('Vegan Pancakes', 'Try this vegan fluffy American pancake recipe for a perfect start to the day. Serve these pancakes with fresh berries, maple syrup or chocolate sauce for a really luxurious start to the day.', 30, 15, 'Starter', 2);

-- Recipe 8
INSERT INTO recipes (title, description, prep_time, cook_time, category, servings)
VALUES ('Spaghetti Bolognese', 'Once you have got this grown-up Spaghetti Bolognese, any left overs will taste even better next day', 30, 120, 'Main', 6);

