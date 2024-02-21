<?php
    require './connection.php';

    if(isset($_POST['submitbtn']))
    {
        $category_name = mysqli_real_escape_string($connection,$_POST['category_name']);
        $is_active = mysqli_real_escape_string($connection,$_POST['is_active']);
        $insert_date = mysqli_real_escape_string($connection,$_POST['insert_date']);
        

        $insertq = mysqli_query($connection,"INSERT INTO `tbl_category`(`category_name`,`is_active`, `insert_date`) VALUES ('{$category_name}','{$is_active}',CURRENT_DATE())") or die(mysqli_errno($connection));
        if($insertq)
        {
            echo ("<script>alert('Product Added');</script>");
            
        }
    }
?>
<html>
    <body>
        <form method="post" enctype="multipart/form-data">
            <h1>Product Insert</h1>
            <table>
                <tr>
                    <td>SubCategoryName</td>
                    <td> <input type="text" required="true" name="category_name" placeholder="SubCategoryName"></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td> 
                        <select name="Category">
                            <option>SmartMobile</option>
                            <option>Leptop</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Is_Active</td>
                    <td> 
                        <select name="is_active">
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td> <input type="submit" name="submitbtn" value="Submit"></td>
                </tr>
            </tabel>
        </form>
    </body>
</html>
