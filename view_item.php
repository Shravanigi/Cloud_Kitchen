<!doctype html>
<html lang="en">
<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <title id=title>Item</title>
    <link rel = "icon" href ="img/logo.jpg" type = "image/x-icon">
    <style>
    #cont {
        min-height : 578px;
    }
    </style>
</head>
<body>
    <?php include 'partials/_dbconnect.php';?>
    <?php require 'partials/_nav.php' ?>

    <div class="container my-4" id="cont">
        <div class="row jumbotron">
        <?php
            $aId = $_GET['aId'];
            $sql = "SELECT * FROM `item` WHERE aId = $aId";
            $result = mysqli_query($conn, $sql);
            $row = mysqli_fetch_assoc($result);
            $Name = $row['Name'];
            $Price = $row['Price'];
            $Desc = $row['Desc'];
            $CategorieId = $row['CategorieId'];
        ?>
        <script> document.getElementById("title").innerHTML = "<?php echo $Name; ?>"; </script> 
        <?php
        echo  '<div class="col-md-4">
                <img src="img/item-'.$aId. '.jpg" width="249px" height="262px">
            </div>
            <div class="col-md-8 my-4">
                <h3>' . $Name . '</h3>
                <h5 style="color: #ff0000">Rs. '.$Price. '/-</h5>
                <p class="mb-0">' .$Desc .'</p>';

                if($loggedin){
                    $quaSql = "SELECT `itemQuantity` FROM `viewcart` WHERE aId = '$aId' AND `userId`='$userId'";
                    $quaresult = mysqli_query($conn, $quaSql);
                    $quaExistRows = mysqli_num_rows($quaresult);
                    if($quaExistRows == 0) {
                        echo '<form action="partials/_manageCart.php" method="POST">
                              <input type="hidden" name="itemId" value="'.$aId. '">
                              <button type="submit" name="addToCart" class="btn btn-primary my-2">Add to Cart</button>';
                    }else {
                        echo '<a href="viewCart.php"><button class="btn btn-primary my-2">Go to Cart</button></a>';
                    }
                }
                else{
                    echo '<button class="btn btn-primary my-2" data-toggle="modal" data-target="#loginModal">Add to Cart</button>';
                }
                echo '</form>
                <h6 class="my-1"> View </h6>
                <div class="mx-4">
                    <a href="view_itemList.php?catid=' . $CategorieId . '" class="active text-dark">
                    <i class="fas fa-qrcode"></i>
                        <span>All Item</span>
                    </a>
                </div>
                <div class="mx-4">
                    <a href="" class="active text-dark">
                    <i class="fas fa-qrcode"></i>
                        <span>All Category</span>
                    </a>
                </div>
            </div>'
        ?>
        </div>
    </div>

   
</body>
</html>