<?php
    require './connection.php';

    $pid = $_GET['pid'];
    $productq = mysqli_query($connection,"select * from tbl_productmaster where pro_id ='{$pid}'") or die(mysqli_error($connection));

    $count = mysqli_num_rows($productq);
    if($count<1)
    {
        header("location:product-listing.php");
    }
    $productdetails = mysqli_fetch_array($productq);

    echo "<h3> {$productdetails['pro_titel']}</h3>";

    echo "<img style='width:250px; 'img src='upload/{$productdetails['pro_imagepath']}'>";

    echo "</br>Price :Rs.<b>{$productdetails['pro_price']}</b>";
    echo "</br>Details :{$productdetails['pro_details']}";
?>
<form method="get" action="cart-process.php">
    <input type="hidden" name="pid" value="<?php echo $pid  ?>">
    Qty <input type="number" name="qty" min="1" max="10">

    <input type="submit" value="Add to Cart">


</form>
