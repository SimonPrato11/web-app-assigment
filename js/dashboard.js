document.addEventListener('DOMContentLoaded', function () {
  // Set user info from session (you can fetch this via AJAX too if needed)
  document.getElementById('userName').innerText =
    sessionStorage.getItem('name');
  document.getElementById('userEmail').innerText =
    sessionStorage.getItem('email') || 'Email not set';

  // Handle form submission for search
  document
    .getElementById('searchForm')
    .addEventListener('submit', function (e) {
      e.preventDefault();

      // Get form data and build query string for GET request
      const formData = new FormData(this);
      const queryParams = new URLSearchParams(formData).toString(); // Converts form data to query params

      // Send the GET request with query parameters
      fetch('dashboard.php?' + queryParams, {
        method: 'GET',
      })
        .then((response) => response.json())
        .then((data) => {
          // Clear current results
          const recipesList = document.getElementById('recipesList');
          recipesList.innerHTML = '';

          // Check if recipes are returned
          if (data.recipes.length > 0) {
            data.recipes.forEach((recipe) => {
              // Check if this recipe is a favorite
              const isFavorite = data.favorites.includes(recipe.recipe_id);
              const favoriteText = isFavorite
                ? 'Remove from Favorites'
                : 'Add to Favorites';

              // Get the rating for this recipe, defaulting to "Not rated" if no rating exists
              const rating = data.ratings[recipe.recipe_id] || 'Not rated';

              // Create list item for each recipe
              const li = document.createElement('li');
              li.innerHTML = `
                          <strong>${recipe.title}</strong>
                          <p>${recipe.description}</p>
                          <p><strong>Category:</strong> ${recipe.category}</p>
                          <p><strong>Prep Time:</strong> ${recipe.prep_time} minutes</p>
                          <p><strong>Cook Time:</strong> ${recipe.cook_time} minutes</p>
                          <p><strong>Servings:</strong> ${recipe.servings}</p>
                          <p><strong>Rating:</strong> ${rating}</p>
                          <label for="rating-${recipe.recipe_id}">Rate this recipe:</label>
                          <select class="rating-select" data-recipe-id="${recipe.recipe_id}" id="rating-${recipe.recipe_id}">
                            <option value="">Select a rating</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                          </select>
                          <button class="favorite-btn" data-recipe-id="${recipe.recipe_id}">
                            ${favoriteText}
                          </button>
                      `;
              recipesList.appendChild(li);
            });

            // Add event listeners to rating selects
            document.querySelectorAll('.rating-select').forEach((select) => {
              select.addEventListener('change', function () {
                const recipeId = this.getAttribute('data-recipe-id');
                const ratingValue = this.value;
                if (ratingValue) {
                  rateRecipe(recipeId, ratingValue);
                }
              });
            });

            // Add event listeners to favorite buttons
            document.querySelectorAll('.favorite-btn').forEach((button) => {
              button.addEventListener('click', function () {
                const recipeId = this.getAttribute('data-recipe-id');
                toggleFavorite(recipeId, this);
              });
            });
          } else {
            recipesList.innerHTML =
              '<p>No recipes found matching your search criteria.</p>';
          }
        })
        .catch((error) => {
          console.error('Error fetching recipes:', error);
        });
    });

  // Function to rate a recipe
  function rateRecipe(recipeId, ratingValue) {
    fetch('rate_recipe.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: `recipe_id=${recipeId}&taste_rating=${ratingValue}`,
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.avg_rating) {
          // Update the displayed rating
          document.getElementById(
            `rating-${recipeId}`
          ).previousElementSibling.innerText = `Rating: ${data.avg_rating}`;
        } else if (data.error) {
          alert(`Error: ${data.error}`);
        }
      })
      .catch((error) => {
        console.error('Error submitting rating:', error);
      });
  }

  // Function to toggle the favorite status of a recipe
  function toggleFavorite(recipeId, button) {
    const isCurrentlyFavorite = button.innerText === 'Remove from Favorites';
    const action = isCurrentlyFavorite ? 'remove' : 'add';

    // If the action is to add the recipe to favorites, send a POST request
    if (action === 'add') {
      fetch('save_favorite.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `user_id=${sessionStorage.getItem(
          'user_id'
        )}&recipe_id=${recipeId}`,
      })
        .then((response) => response.text())
        .then((data) => {
          if (data.includes('Recipe saved to favorites')) {
            button.innerText = 'Remove from Favorites';
          } else {
            console.error('Error adding to favorites:', data);
          }
        })
        .catch((error) => {
          console.error('Error saving to favorites:', error);
        });
    } else {
      // Handle remove favorite logic here if needed
      console.log('Removing from favorites is not yet implemented.');
    }
  }
});
