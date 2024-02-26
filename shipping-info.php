<?php
require './connection.php';
session_start();
if($_POST)
{
    $name = $_POST['txt1'];
    $mobile = $_POST['txt2'];
    $address = $_POST['txt3'];
    $userid = $_SESSION['user_id'];
    $currentdate = date('d-m-y');
    
    $ordermasterq = mysqli_query($connection,"insert into order_master (order_date,user_id,order_status,shippingname,shippingmobile,shippingaddress) values('{$currentdate}','{$userid}','Pending','{$name}','{$mobile}','{$address}')") or die(mysqli_error($connection));

    $orderid = mysqli_insert_id($connection);

    foreach($_SESSION['productcart'] as $key => $value){
        $productq = mysqli_query($connection,"select * from tbl_productmaster where pro_id='{$value}'") or die(mysqli_error($connection));
        $productdetails = mysqli_fetch_array($productq);
        $qty = $_SESSION['qtycart'][$key];

        $orderdetailsquery = mysqli_query($connection,"insert into order_details ('order_id','pro_id','pro_qty','pro_price') values('{$orderid}','{$value}','{$qty}','{$productdetails['pro_price']}')")or die(mysqli_errno($connection));
    }
    unset($_SESSION['productcart']);
    unset($_SESSION['counter']);
    unset($_SESSION['qtycart']);

    echo "<script>alert('Thanks Your Order Placed'); window.location='productlisting.php';</script>";
}

?>
<html>
    <body>
        
        <h1>Shipping Info</h1>
        <form method="post">
            Name:<input type="text" name="txt1">
            <br/>
            Mobile:<input type="text" name="txt2">
            <br/>
            Address:<textarea name="txt3"></textarea>
            <br/>
            <input type="submit" value="Confirm Order">
        </form>
    </body>

</html>