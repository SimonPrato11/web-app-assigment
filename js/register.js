// register.js
document
  .getElementById('registerForm')
  .addEventListener('submit', function (e) {
    e.preventDefault(); // Prevent the form from submitting the traditional way

    // Get form data
    const formData = new FormData(this);

    // Clear any previous error messages
    document.getElementById('errorMessages').innerHTML = '';

    // Send the form data using fetch API
    fetch('register.php', {
      method: 'POST',
      body: formData,
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          // Registration successful, redirect to login page or show success message
          alert('Registration successful!');
          window.location.href = 'login.php'; // Redirect to login page
        } else {
          // Display errors
          const errorMessages = data.errors
            .map((error) => `<p>${error}</p>`)
            .join('');
          document.getElementById('errorMessages').innerHTML = errorMessages;
        }
      })
      .catch((error) => console.error('Error:', error));
  });
