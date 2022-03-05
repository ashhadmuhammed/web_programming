<?php
require_once('config.php');

if ($_SERVER['REQUEST_METHOD']=="POST") {
    if (isset($_POST['submit'])) {
        function validate_input($data)
        {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
        }
        $title=validate_input($_POST['title']);
        $author=validate_input($_POST['author']);
        $edition=validate_input($_POST['edition']);
        $publisher=validate_input($_POST['publisher']);
        $price=validate_input($_POST['price']);
        $category=validate_input($_POST['category']);
      


        $sql="INSERT INTO `book`( `b_name`, `edition`, `publication`, `b_author`,`category`,`b_price`) VALUES ('$title','$edition','$publisher','$author','$category','$price')";
        if (mysqli_query($con, $sql)) {
          echo "<script>alert('Book Inserted'); window.location.href='add_book.php';</script>";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($con);
        }
    }
}



?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Insert book</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
  <div class="nav">
           <div style="padding-left:10px">
           <a href="admin_home.php">

<h2>LMS</h2>
</a>
           </div>
           <div >
    
        <a class="nav-item" href="search_book.php">Search Books</a>
        <a class="nav-item" href="issue_book.php">Issue Books</a>
        <a class="nav-item" href="renew_book.php">Renew Books</a>
        <a class="nav-item" href="return_book.php">Return Books</a>
     </div>

       </div>
    <div class="container">
      <h3>Insert Book</h3>
      <form action="add_book.php" method="post" class="form">
        <input
          type="text"
          class="ip-item"
          name="title"
          required
          id=""
          placeholder="Title"
        />
        <input
          type="text"
          required
          class="ip-item"
          name="author"
          id=""
          placeholder="Author Name"
        />
        <input
          type="number"
          required
          class="ip-item"
          name="edition"
          id=""
          placeholder="Edition(enter 3 for Third Edition)"
        />
        <input
          type="text"
          required
          class="ip-item"
          name="publisher"
          id=""
          placeholder="Publisher"
        />
        <input
          type="text"
          required
          class="ip-item"
          name="category"
          id=""
          placeholder="Category"
        />
        <input
          type="text"
          required
          class="ip-item"
          name="price"
          id=""
          placeholder="Price"
        />
        <button class="btn" type="submit" name="submit">Add Book</button>
      </form>
    </div>
  </body>
</html>
