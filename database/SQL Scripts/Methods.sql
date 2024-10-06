CREATE TABLE methods (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT, -- Foreign key to the recipes table
    step_number INT NOT NULL,
    step_description TEXT NOT NULL, -- Description of the step
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

INSERT INTO methods (recipe_id, step_number, step_description)
VALUES 
(1, 1, 'Preheat the oven to 180C/200C Fan/Gas 4.'),
(1, 2, 'To make the chilli sauce, heat the chopped tomatoes, rose harissa, sugar, and lemon juice in a saucepan over medium heat. Cook for 10 minutes until thick.'),
(1, 3, 'For the onion, mix together the onion slices, vinegar, and parsley. Set aside.'),
(1, 4, 'To make the yoghurt sauce, mix yoghurt with dried mint, season with salt and pepper, and set aside.'),
(1, 5, 'Put the pittas in the oven to warm for 5 minutes.'),
(1, 6, 'To make the “doner”, heat a frying pan over medium-high heat. Add the mushrooms and dry-fry for 2 minutes. Add garlic oil, paprika, coriander, celery salt, garlic granules, black pepper, and stir-fry for 1 minute.'),
(1, 7, 'Split the warmed pitta breads. Add cabbage, tomato, onion, and mushrooms. Drizzle with chilli and yoghurt sauces. Serve topped with pickled chillies, if using.');

-- Insert Method Steps for Mango Custard Pie
INSERT INTO methods (recipe_id, step_number, step_description)
VALUES 
(2, 1, 'Finely crush the biscuits by putting into a sealed plastic bag and bashing with a rolling pin (alternatively, pulse to crumbs using a food processor). Transfer to a mixing bowl and add the sugar, cardamom, and salt, stirring well to combine.'),
(2, 2, 'Pour the melted butter over the biscuit crumbs and mix until thoroughly combined. Put half the crumb mixture in a 23cm/9in metal pie tin and press evenly with your fingers. Build up the sides of the tin, compressing the base as much as possible to prevent it from crumbling. Repeat with the rest of the mixture in the second tin.'),
(2, 3, 'Preheat the oven to 160C/325F/Gas 3. Put the pie bases in the freezer for 15 minutes. Remove and bake for 12 minutes, or until golden brown. Transfer to a wire rack to cool.'),
(2, 4, 'Pour 177ml/6fl oz of cold water into a large bowl. In a separate bowl, mix the gelatine with half the sugar and sprinkle it over the water. Leave to stand for a couple of minutes.'),
(2, 5, 'Meanwhile, whip the cream with the remaining sugar to form medium stiff peaks. Set aside.'),
(2, 6, 'Heat about a quarter of the mango pulp in a saucepan over medium-low heat until just warm. Make sure you do not boil it. Pour into the gelatine mixture and whisk until well combined. The gelatine should dissolve completely. Gradually whisk in the remaining mango pulp.'),
(2, 7, 'Beat the cream cheese in a bowl until soft and smooth. Add to the mango mixture with the salt. Blend the mixture using a hand blender until completely smooth. Gently tap the bowl on the kitchen counter once or twice to pop any air bubbles.'),
(2, 8, 'Fold about a quarter of the mango mixture into the whipped cream using a spatula. Repeat with the rest of the cream until no streaks remain.'),
(2, 9, 'Divide the filling between the cooled bases, using a rubber spatula to smooth out the filling. Refrigerate overnight, or for at least 5 hours, until firm and chilled.');




-- Insert Method Steps for the Plum Tart Recipe
INSERT INTO methods (recipe_id, step_number, step_description)
VALUES 
(3, 1, 'Preheat the oven to 180C/350F/Gas 4.'),
(3, 2, 'Pour the milk, cream and vanilla into a pan and boil for a minute. Remove from the heat and set aside to cool.'),
(3, 3, 'Tip the eggs and sugar into a bowl and beat together until light and fluffy. Fold the flour into the mixture, a little at a time.'),
(3, 4, 'Pour the cooled milk and cream onto the egg and sugar mixture, whisking lightly. Set aside.'),
(3, 5, 'Place a little butter into an ovenproof dish and heat in the oven until foaming. Add the plums and brown sugar and bake for 5 minutes, then pour the batter into the dish and scatter with flaked almonds, if using.'),
(3, 6, 'Cook in the oven for about 30 minutes, until golden-brown and set but still light and soft inside.'),
(3, 7, 'Dust with icing sugar and serve immediately with cream.');


-- Insert Method for the Couscous Recipe
INSERT INTO methods (recipe_id, step_number, step_description)
VALUES 
(4, 1, 'In a large bowl, mix all the ingredients together except the rocket.'),
(4, 2, 'Taste and adjust the seasoning, adding more salt if necessary.'),
(4, 3, 'Toss in the rocket and serve immediately.');


-- Insert Method for the Lamb Recipe
INSERT INTO methods (recipe_id, step_number, step_description)
VALUES 
(5, 1, 'Heat the oil in a non-stick frying pan over a medium heat. Add the onions and stir-fry for 15–18 minutes, or until lightly browned and crispy.'),
(5, 2, 'Put half the onions in a non-metallic mixing bowl with the yoghurt, ginger, garlic, chilli powder, cumin, cardamom, half of the salt, the lime juice, half of the chopped coriander and mint and the green chillies. Stir well to combine. Set aside the remaining coriander and mint for layering the biryani.'),
(5, 3, 'Add the lamb to the mixture and stir to coat evenly. Cover and marinade in the fridge for 6–8 hours, or overnight if possible.'),
(5, 4, 'Preheat the oven to 240C/Fan 220C/Gas 9.'),
(5, 5, 'Heat the cream and milk in a small saucepan, add the saffron, remove from the heat and leave to infuse for 30 minutes.'),
(5, 6, 'Cook the rice in a large saucepan in plenty of boiling water with the remaining salt for 6–8 minutes, or until it is just cooked, but still has a bite. Drain the rice.'),
(5, 7, 'Spread half of the lamb mixture evenly in a wide, heavy-based casserole and cover with a layer of half the rice. Sprinkle over half of the reserved onions and half of the reserved coriander and mint. Sprinkle over half of the saffron mixture.'),
(5, 8, 'Repeat with the remaining lamb, rice, onions, herbs and saffron mixture.'),
(5, 9, 'Cover with a tight fitting lid, turn down the oven to 200C/Fan 180C/Gas 6 and cook for 1 hour.'),
(5, 10, 'Remove and allow to stand for 15–20 minutes before serving. Garnish with pomegranate seeds if desired.');



-- Insert Method Steps for the Vegetable Flatbread
INSERT INTO methods (recipe_id, step_number, step_description)
VALUES 
(6, 1, 'Preheat the oven to 220C/200C Fan/Gas 7.'),
(6, 2, 'To prepare the topping, put the pepper, courgette, red onion, and oil in a bowl, season with lots of black pepper and mix together. Scatter the vegetables over a large baking tray and roast for 15 minutes.'),
(6, 3, 'Meanwhile, make the pizza base. Mix the flour and salt in a large bowl. Add the yoghurt and 1 tablespoon of cold water and mix with a spoon, then use your hands to form a soft, spongy dough. Turn out onto a lightly floured surface and knead for about 1 minute.'),
(6, 4, 'Using a floured rolling pin, roll the dough into a roughly oval shape, approx. 3mm/⅛in thick, turning regularly. (Ideally, the pizza should be around 30cm/12in long and 20cm/8in wide, but it doesn’t matter if the shape is uneven, it just needs to fit onto the same baking tray that the vegetables were cooked on.)'),
(6, 5, 'Transfer the roasted vegetables to a bowl. Slide the pizza dough onto the baking tray and bake for 5 minutes. Take the tray out of the oven and turn the dough over.'),
(6, 6, 'For the tomato sauce, mix the passata with the oregano and spread over the dough. Top with the roasted vegetables, sprinkle with the chilli flakes and then the cheese. Bake the pizza for a further 8–10 minutes, or until the dough is cooked through and the cheese beginning to brown.'),
(6, 7, 'Season with black pepper, drizzle with a slurp of olive oil and, if you like, scatter fresh basil leaves on top just before serving.');

-- Insert Method for the Recipe
INSERT INTO methods (recipe_id, step_number, step_description)
VALUES 
(7, 1, 'Put the flour, sugar, baking powder and salt in a bowl and mix thoroughly.'),
(7, 2, 'Add the milk and vanilla extract and mix with a whisk until smooth.'),
(7, 3, 'Place a large non-stick frying pan over a medium heat.'),
(7, 4, 'Add 2 teaspoons of the oil and wipe around the pan with a heatproof brush or carefully using a thick wad of kitchen paper.'),
(7, 5, 'Once the pan is hot, pour a small ladleful (around two dessert spoons) of the batter into one side of the pan and spread with the back of the spoon until around 10cm/4in in diameter.'),
(7, 6, 'Make a second pancake in exactly the same way, greasing the pan with the remaining oil before adding the batter.'),
(7, 7, 'Cook for about a minute, or until bubbles are popping on the surface and just the edges look dry and slightly shiny.'),
(7, 8, 'Quickly and carefully flip over and cook on the other side for a further minute, or until light, fluffy and pale golden brown.'),
(7, 9, 'Transfer to a plate and keep warm in a single layer (so they don’t get squished) on a baking tray in a low oven while the rest of the pancakes are cooked in exactly the same way.'),
(7, 10, 'Serve with your preferred toppings.');



-- Insert Method Steps for the Recipe
INSERT INTO methods (recipe_id, step_number, step_description)
VALUES 
(8, 1, 'Heat the oil in a large, heavy-based saucepan and fry the bacon until golden over a medium heat.'),
(8, 2, 'Add the onions and garlic, frying until softened.'),
(8, 3, 'Increase the heat and add the minced beef. Fry it until it has browned, breaking down any chunks of meat with a wooden spoon.'),
(8, 4, 'Pour in the wine and boil until it has reduced in volume by about a third.'),
(8, 5, 'Reduce the temperature and stir in the tomatoes, drained mushrooms, bay leaves, oregano, thyme and balsamic vinegar.'),
(8, 6, 'Either blitz the sun-dried tomatoes in a small blender with a little of the oil to loosen, or just finely chop before adding to the pan.'),
(8, 7, 'Season well with salt and pepper. Cover with a lid and simmer the Bolognese sauce over a gentle heat for 1-1½ hours until it\'s rich and thickened, stirring occasionally.'),
(8, 8, 'At the end of the cooking time, stir in the basil and add any extra seasoning if necessary.'),
(8, 9, 'Remove from the heat to "settle" while you cook the spaghetti in plenty of boiling salted water (for the time stated on the packet).'),
(8, 10, 'Drain and divide between warmed plates.'),
(8, 11, 'Scatter a little parmesan over the spaghetti before adding a good ladleful of the Bolognese sauce, finishing with a scattering of more cheese and a twist of black pepper.');



