DROP TABLE IF EXISTS ingredients; -- Optional: Use this if you want to recreate the table
CREATE TABLE ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT, -- Foreign key to the recipes table
    ingredient_name VARCHAR(255) NOT NULL,
    quantity VARCHAR(100) NOT NULL, -- e.g., "2 tbsp", "1 x 400g tin"
    instructions VARCHAR(255), -- e.g., "very thinly sliced", "chopped"
    ingredient_section VARCHAR(100), -- Added for section information
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id) ON DELETE CASCADE
);


-- Ingredients for the Chilli Sauce
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions, ingredient_section)
VALUES 
(1, 'Chopped tomatoes (tin)', '1 x 400g', '', 'Chilli Sauce'),
(1, 'Rose harissa', '2 tbsp', '', 'Chilli Sauce'),
(1, 'Caster sugar', '2 tsp', '', 'Chilli Sauce'),
(1, 'Lemon juice', 'Good squeeze', '', 'Chilli Sauce');

-- Ingredients for the Onion
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions, ingredient_section)
VALUES 
(1, 'Onion', '1', 'Very thinly sliced into half moons', 'Onion'),
(1, 'White wine vinegar', '2 tsp', '', 'Onion'),
(1, 'Flatleaf parsley', '20g', 'Finely chopped', 'Onion');

-- Ingredients for the Yoghurt Sauce
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions, ingredient_section)
VALUES 
(1, 'Plain yoghurt', '150g', '', 'Yoghurt Sauce'),
(1, 'Dried mint', '1 heaped tsp', '', 'Yoghurt Sauce'),
(1, 'Salt and black pepper', 'To taste', '', 'Yoghurt Sauce');

-- Ingredients for the ‘Doner’
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions, ingredient_section)
VALUES 
(1, 'Oyster mushrooms', '500g', 'Very thinly sliced lengthways', 'Doner'),
(1, 'Garlic oil', '2 tsp', '', 'Doner'),
(1, 'Sweet paprika', '2 tsp', '', 'Doner'),
(1, 'Ground coriander', '2 heaped tsp', '', 'Doner'),
(1, 'Celery salt', '2 tsp', '', 'Doner'),
(1, 'Garlic granules', '3 tsp', '', 'Doner'),
(1, 'Black pepper', '½ tsp', '', 'Doner'),
(1, 'White pitta breads', '4', '', 'Doner');

-- Ingredients for the Garnish
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions, ingredient_section)
VALUES 
(1, 'White cabbage', '¼ small', 'Very finely shredded', 'Garnish'),
(1, 'Tomatoes', '2', 'Sliced into half moons', 'Garnish'),
(1, 'Pickled chillies', '4–6', 'Thinly sliced (optional)', 'Garnish');




-- Insert Ingredients for the Biscuit Base
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions, ingredient_section)
VALUES 
(2, 'Digestive biscuits', '280g/10oz', 'Finely crushed', 'Biscuit Base'),
(2, 'Granulated sugar', '65g/2¼oz', '', 'Biscuit Base'),
(2, 'Ground cardamom', '¼ tsp', '', 'Biscuit Base'),
(2, 'Unsalted butter, melted', '128g/4½oz', '', 'Biscuit Base'),
(2, 'Sea salt', 'Large pinch', '', 'Biscuit Base');

-- Insert Ingredients for the Mango Custard Filling
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions, ingredient_section)
VALUES 
(2, 'Granulated sugar', '100g/3½oz', '', 'Mango Custard Filling'),
(2, 'Powdered gelatine', '2 tbsp plus ¼ tsp', '', 'Mango Custard Filling'),
(2, 'Double cream', '120ml/4fl oz', '', 'Mango Custard Filling'),
(2, 'Cream cheese', '115g/4oz', 'At room temperature', 'Mango Custard Filling'),
(2, 'Alfonso mango pulp', '850g tin', '', 'Mango Custard Filling'),
(2, 'Sea salt', 'Large pinch', '', 'Mango Custard Filling');

-- Insert Ingredients for the Plum Tart Recipe
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions)
VALUES 
(3, 'Milk', '125ml/4½fl oz', ''),
(3, 'Double cream', '125ml/4½fl oz', ''),
(3, 'Vanilla essence', '2-3 drops', ''),
(3, 'Free-range eggs', '4', ''),
(3, 'Caster sugar', '170g/6oz', ''),
(3, 'Plain flour', '1 tbsp', ''),
(3, 'Butter', '30g/1oz', ''),
(3, 'Plums', '500g/1lb 2oz', 'Cut in half, stones removed'),
(3, 'Brown sugar', '2 tbsp', ''),
(3, 'Flaked almonds', '30g/1oz', 'Optional'),
(3, 'Icing sugar', 'For dusting', ''),
(3, 'Double cream', 'To serve', '');


-- Insert Ingredients for the Couscous Recipe
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions)
VALUES 
(4, 'Couscous', '225g/8oz', 'Prepared according to the packet instructions'),
(4, 'Preserved lemons', '8 small', 'Flesh and rind finely chopped'),
(4, 'Dried cranberries', '180g/6⅓oz', ''),
(4, 'Pine nuts', '120g/4⅓oz', 'Toasted'),
(4, 'Unsalted shelled pistachio nuts', '160g/5¾oz', 'Roughly chopped'),
(4, 'Olive oil', '125ml/4fl oz', ''),
(4, 'Flatleaf parsley', '60g/2¼oz', 'Finely chopped'),
(4, 'Garlic cloves', '4', 'Crushed'),
(4, 'Red wine vinegar', '4 tbsp', ''),
(4, 'Red onion', '1', 'Finely chopped'),
(4, 'Salt', '1 tsp', 'Or to taste'),
(4, 'Rocket leaves', '80g/2¾oz', '');


-- Insert Ingredients for the Lamb Recipe
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions)
VALUES 
(5, 'Vegetable oil', '5 tbsp', ''),
(5, 'Onions', '2', 'Finely sliced'),
(5, 'Greek or natural yoghurt', '200g/7oz', ''),
(5, 'Ginger', '4 tbsp', 'Finely grated'),
(5, 'Garlic', '3 tbsp', 'Finely grated'),
(5, 'Kashmiri red chilli powder', '1–2 tsp', ''),
(5, 'Ground cumin', '5 tsp', ''),
(5, 'Ground cardamom seeds', '1 tsp', ''),
(5, 'Sea salt', '4 tsp', ''),
(5, 'Lime', '1', 'Juice only'),
(5, 'Coriander leaves and stalks', '30g/1oz', 'Finely chopped'),
(5, 'Mint leaves', '30g/1oz', 'Finely chopped'),
(5, 'Green chillies', '3–4', 'Finely chopped'),
(5, 'Boneless lamb tenderloin or leg', '800g/1lb 12oz', 'Cut into bite-sized pieces'),
(5, 'Double cream', '4 tbsp', ''),
(5, 'Full-fat milk', '1½ tbsp', ''),
(5, 'Saffron strands', '1 tsp (a large pinch)', ''),
(5, 'Basmati rice', '400g/14oz', ''),
(5, 'Pomegranate seeds', '2 tbsp', 'To garnish (optional)');



-- Insert Ingredients for the Vegetable Flatbread
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions)
VALUES 
(6, 'Self-raising brown or wholemeal flour', '125g/4½oz', 'Plus extra for dusting'),
(6, 'Fine sea salt', 'Pinch', ''),
(6, 'Full-fat plain yoghurt', '125g/4½oz', ''),
(6, 'Yellow or orange pepper', '1', 'Seeds removed and thinly sliced'),
(6, 'Courgette', '1', 'Cut into 1cm/½in slices'),
(6, 'Red onion', '1', 'Cut into thin wedges'),
(6, 'Extra virgin olive oil', '1 tbsp', 'Plus extra for drizzling'),
(6, 'Dried chilli flakes', '½ tsp', ''),
(6, 'Ready-grated mozzarella or cheddar', '50g/1¾oz', 'Or goat’s cheese, broken into small chunks, or 1 mozzarella ball, sliced or roughly torn'),
(6, 'Freshly ground black pepper', 'To taste', ''),
(6, 'Fresh basil leaves', 'To serve', 'Optional'),
(6, 'Passata sauce', '6 tbsp (approximately 100g/3½oz)', ''),
(6, 'Dried oregano', '1 tsp', '');


-- Insert Ingredients for the Recipe
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions)
VALUES 
(7, 'Self-raising flour', '125g/4½oz', ''),
(7, 'Caster sugar', '2 tbsp', ''),
(7, 'Baking powder', '1 tsp', ''),
(7, 'Sea salt', 'good pinch', ''),
(7, 'Soya milk or almond milk', '150ml/5fl oz', ''),
(7, 'Vanilla extract', '¼ tsp', ''),
(7, 'Sunflower oil', '4 tsp', 'for frying');



-- Insert Ingredients for the Recipe
INSERT INTO ingredients (recipe_id, ingredient_name, quantity, instructions)
VALUES 
(8, 'Olive oil or sun-dried tomato oil', '2 tbsp', ''),
(8, 'Smoked streaky bacon', '6 rashers, chopped', ''),
(8, 'Onions', '2 large, chopped', ''),
(8, 'Garlic cloves', '3, crushed', ''),
(8, 'Lean minced beef', '1kg/2¼lb', ''),
(8, 'Red wine', '2 large glasses', ''),
(8, 'Chopped tomatoes', '2 x 400g cans', ''),
(8, 'Antipasti marinated mushrooms', '1 x 290g jar, drained', ''),
(8, 'Bay leaves', '2, fresh or dried', ''),
(8, 'Dried oregano', '1 tsp or a small handful of fresh leaves, chopped', ''),
(8, 'Dried thyme', '1 tsp or a small handful of fresh leaves, chopped', ''),
(8, 'Balsamic vinegar', 'Drizzle', ''),
(8, 'Sun-dried tomato halves', '12-14, in oil', ''),
(8, 'Salt', 'To taste', ''),
(8, 'Freshly ground black pepper', 'To taste', ''),
(8, 'Fresh basil leaves', 'A good handful, torn into small pieces', ''),
(8, 'Dried spaghetti', '800g-1kg/1¾-2¼lb', ''),
(8, 'Freshly grated parmesan', 'To serve', '');



