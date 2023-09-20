<?php
session_start();
include 'connection.php';
include 'userfunctions.php';

if ($_SESSION['isloggedin'] != 1) {
    header("Location: index.php");
    exit();
}

// Check eza cart session variable is set eza no bta3mela initialize be empty array
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array(); 
}

// bte5od el cart items men el session w btesnedon la variable esma cartItems
$cartItems = $_SESSION['cart'];



//hon 3m nsewe fetch lal product details la kel el items bel cart.mna3mol iteration be $cartItems be foreach loop 
//w mntali3 info 3an products be function getSlugActive2() hal details ele tol3o menhoton be $cartProducts array
$cartProducts = array();
foreach ($cartItems as $item) {

    $product_data = getSlugActive2('product', $item);
    $product = mysqli_fetch_array($product_data);
    if ($product) {
        $cartProducts[] = $product;
    }
}

?>

<html>
<head>
    <title>cart</title>
    <style>
        h1{
            margin-left:40px;
            margin-top:20px;
        }
        .tbl{
            margin:40px;
        }
        .btn{
            border-radius:10px;
            cursor:pointer;
            width:130px;
            height:40px;
            text-decoration: none; 
            margin-left:40px;
            border:1px solid;
            background-color:#f1f1f1;
        }
        .btn a{
            text-decoration: none;
            color:black;
        }
    </style>
</head>
<body>
    <h1>Cart</h1>

    <?php if (empty($cartProducts)) : ?>
        <p>Your cart is empty.</p>
    <?php else : ?>
        <table class='tbl'border="2" width="70%">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Brand Name </th>
                    <th>Product Image</th>
                    <th>Product Description</th>
                    <th>Price $</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($cartProducts as $product) : ?>
                    <tr>
                        <td><?php echo isset($product['productname']) ? $product['productname'] : ''; ?></td>
                       
                        <td><?php echo isset($product['brandname']) ? $product['brandname'] : ''; ?></td>
                        <td><img src="<?php echo $product['productimage']; ?>" alt="Product Image" width="70px" height="70px"/></td>
                          <td><?php echo isset($product['productdesc']) ? $product['productdesc'] : ''; ?></td>
                         <td><?php echo isset($product['price']) ? $product['price']: ''; ?></td>
                        
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>

        <button class="btn"><a href="shop.php">Continue Shopping</a></button>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
