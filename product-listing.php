<?php
require './connection.php';

$subcategoryquery = mysqli_query($connection,"select * from tbl_subcategory")or die(mysqli_error($connection));

while($subcatrow = mysqli_fetch_array($subcategoryquery))
{
    echo "<a href='product-listing.php?scatid={$subcatrow['sub_category_id']}'>{$subcatrow['sub_category_name']} </a> |";
}
?>
<form method="get">
    Search :<input type="text" name="search">
    <input type="submit" value="Search">
</form>
<form method="get">
    Start Price :<input type="number" name="price1">
    End Price :<input type="number" name="price2">
    <input type="submit" value="Search">
</form>


<?php

if(isset ($_GET['scatid']))
{
    $subcatid = $_GET['scatid'];
    $productselectq = mysqli_query($connection,"select * from tbl_productmaster where sub_category_id='{$subcatid}'")or die(mysqli_error($connection));
}
else if(isset ($_GET['search']))
{
    $search = $_GET['search'];
    
    $productselectq = mysqli_query($connection,"select * from tbl_productmaster where pro_titel like '%search%'")or die(mysqli_error($connection));
}
else if(isset ($_GET['price1']) && isset ($_GET['price2']))
{
    $price1 = $_GET['price1'];
    $price2 = $_GET['price2'];
    
    $productselectq = mysqli_query($connection,"select * from tbl_productmaster where pro_price between $price1 and $price2")or die(mysqli_error($connection));
}
else
{
    $productselectq = mysqli_query($connection,"select * from tbl_productmaster")or die(mysqli_error($connection));    
}

$count = mysqli_num_rows($productselectq);

if($count<1)
{
    echo "No Records Found";
}else
{
    echo "$count Record Found";
}
while($productrow = mysqli_fetch_array($productselectq))
{
    echo "<br/><br/><br/><br/>".$productrow['pro_titel'];
    echo "<br/>Rs".$productrow['pro_price'];
    echo "<br/><img style='width:150px;height:150px' src='upload/{$productrow['pro_imagepath']}'>";
    echo "<br/><br/><a href='product-details.php?pid={$productrow['pro_id']}'>Details</a>";
}
?>