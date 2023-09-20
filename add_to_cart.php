<?php
session_start();
include 'connection.php';

// 3melet Retrieve lal product name from the AJAX request
$productname = $_POST['product'];

// Retrieve the user's username from the session
$username = $_SESSION['username'];


if (in_array($productname, $_SESSION['cart'])) {
    echo 'already_added';
} else {
    // Update the cart session variable
    $_SESSION['cart'][] = $productname;

    // Update the cart attribute in the userlogin table
    $cartData = implode(',', $_SESSION['cart']);
    $query = "UPDATE userlogin SET cart = '$cartData' WHERE username = '$username'";
    $result = mysqli_query($con, $query);

    if ($result) {
        echo 'success';
    } else {
        echo 'error';
    }
}
?>
