<?php
// Database connection settings
$servername = "localhost";
$username = "root";  // Default username in XAMPP
$password = "";      // Default password is empty in XAMPP
$dbname = "test_database";  // The database you created


// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>
