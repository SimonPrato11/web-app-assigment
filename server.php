<?php
// Database connection settings
$servername = "localhost";
$username = "root";  // Default username in XAMPP
$password = "";      // Default password is empty in XAMPP
$dbname = "recipe_app";  // The database you created


// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);



// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}