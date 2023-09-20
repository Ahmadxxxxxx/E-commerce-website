<?php
session_start();

// Check if the request be2albo the cart data
if (isset($_POST['cart'])) {
    // Update the cart session variable with the new cart data
    //JSON decode bethawil el JSON data into php array
    //true, ensures that the decoded JSON will be returned as an associative array
    $_SESSION['cart'] = json_decode($_POST['cart'], true);
}
