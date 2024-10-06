document.getElementById('loginForm').addEventListener('submit', function (e) {
  e.preventDefault(); // Prevent the default form submission

  // Get form data
  const formData = new FormData(this);

  // Clear any previous error messages
  document.getElementById('errorMessages').innerHTML = '';

  // Send the form data using fetch API
  fetch('login.php', {
    method: 'POST',
    body: formData,
  })
    .then((response) => response.json())
    .then((data) => {
      if (data) {
        // If login is successful, store user info in sessionStorage
        sessionStorage.setItem('user_id', data.user_id);
        sessionStorage.setItem('name', data.name);
        sessionStorage.setItem('email', data.email);

        // Redirect to the dashboard
        window.location.href = 'dashboard.html';
      } else {
        // Display the error message
        document.getElementById(
          'errorMessages'
        ).innerHTML = `<p style="color: red;">${data.message}</p>`;
      }
    })
    .catch((error) => console.error('Error:', error));
});
