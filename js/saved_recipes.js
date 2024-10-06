document.addEventListener('DOMContentLoaded', function () {
  // Fetch saved recipes from the server
  fetch('saved_recipes.php')
    .then((response) => response.json())
    .then((data) => {
      const container = document.getElementById('savedRecipesContainer');
      if (data.length > 0) {
        // Create a list to display saved recipes
        const ul = document.createElement('ul');
        data.forEach((recipe) => {
          const li = document.createElement('li');
          li.innerHTML = `
                        <strong>${recipe.title}</strong>
                        <p>${recipe.description}</p>
                        <p><strong>Category:</strong> ${recipe.category}</p>
                        <p><strong>Prep Time:</strong> ${recipe.prep_time} minutes</p>
                        <p><strong>Cook Time:</strong> ${recipe.cook_time} minutes</p>
                        <p><strong>Servings:</strong> ${recipe.servings}</p>
                    `;
          ul.appendChild(li);
        });
        container.appendChild(ul);
      } else {
        container.innerHTML = '<p>No recipes saved yet.</p>';
      }
    })
    .catch((error) => {
      console.error('Error fetching saved recipes:', error);
    });
});
