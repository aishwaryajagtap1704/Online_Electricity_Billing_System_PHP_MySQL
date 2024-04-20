<?php 
    include("../Includes/session.php");
    include("../Includes/config.php");
    
    $id = $_SESSION['uid'];
    $aid = rand(1, 2);

    if(isset($_POST["submit"])) {
        if(!empty($_POST["complaint"])) {
            $comp = $_POST["complaint"];
        } elseif(!empty($_POST["custom_complaint"])) {
            $comp = $_POST["custom_complaint"];
        } else {
            // Handle error, complaint is empty
        }

        $stat = "NOT PROCESSED"; 

        $query = "INSERT INTO complaint (uid, aid, complaint, status) VALUES ($id, $aid, '$comp', '$stat')";
        mysqli_query($con, $query);  
    }
    
    header("Location:complaint.php");   
?>
