// dashboard.js

document.addEventListener('DOMContentLoaded', function () {
  // Set user info from session (you can fetch this via AJAX too if needed)
  document.getElementById('userName').innerText =
    sessionStorage.getItem('name');
  document.getElementById('userEmail').innerText =
    sessionStorage.getItem('email');

  // Handle form submission
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
              const li = document.createElement('li');
              li.innerHTML = `
                        <strong>${recipe.title}</strong>
                        <p>${recipe.description}</p>
                        <p><strong>Category:</strong> ${recipe.category}</p>
                        <p><strong>Prep Time:</strong> ${recipe.prep_time} minutes</p>
                        <p><strong>Cook Time:</strong> ${recipe.cook_time} minutes</p>
                        <p><strong>Servings:</strong> ${recipe.servings}</p>
                    `;
              recipesList.appendChild(li);
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
});
