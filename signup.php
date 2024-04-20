<?php
require_once("Includes/session.php");

$nameErr = $phoneErr = $addrErr = $emailErr = $passwordErr = $confpasswordErr = "";
$name = $email = $password = $confpassword = $address = $contactNo = "";
$flag = 0;

// Function to sanitize and validate input data
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

if (isset($_POST["reg_submit"])) {
    // Validate and sanitize form inputs
    $name = test_input($_POST["name"]);
    $email = test_input($_POST["email"]);
    $password = test_input($_POST["inputPassword"]);
    $confpassword = test_input($_POST["confirmPassword"]);
    $address = test_input($_POST["address"]);
    $contactNo = test_input($_POST["contactNo"]);

    // NAME VALIDATION
    if (empty($name)) {
        $nameErr = "Name is required";
        $flag = 1;
    } elseif (!preg_match("/^[a-zA-Z ]*$/", $name)) {
        $nameErr = "Only letters and white space allowed";
        $flag = 1;
    }

    // EMAIL VALIDATION
    if (empty($email)) {
        $emailErr = "Email is required";
        $flag = 1;
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $emailErr = "Invalid email format";
        $flag = 1;
    }

    // PASSWORD VALIDATION
    if (empty($password)) {
        $passwordErr = "Password is required";
        $flag = 1;
    }

    // CONFIRM PASSWORD
    if (empty($confpassword)) {
        $confpasswordErr = "Confirm password is required";
        $flag = 1;
    } elseif ($confpassword !== $password) {
        $confpasswordErr = "Passwords do not match";
        $flag = 1;
    }

    // ADDRESS VALIDATION
    if (empty($address)) {
        $addrErr = "Address is required";
        $flag = 1;
    }

    // CONTACT VALIDATION
    if (!empty($contactNo) && !preg_match("/^\d{10}$/", $contactNo)) {
        $phoneErr = "10-digit phone number allowed";
        $flag = 1;
    }

    // Check if there were any validation errors
    if ($flag == 0) {
        require_once("Includes/config.php");
        $sql = "INSERT INTO user (`name`,`email`,`phone`,`pass`,`address`)
                VALUES('$name','$email','$contactNo','$password','$address')";

        if (!mysqli_query($con, $sql)) {
            die('Error: ' . mysqli_error($con));
        }

        // Redirect to a success page or display a success message
        header("Location: success.php");
        exit();
    }
}
?>

<form action="signup.php" method="post" class="form-horizontal" role="form" onsubmit="return validateForm()">
    <center>
        <!-- Display error messages if any -->
        <?php if ($flag == 1): ?>
            <div class="alert alert-danger" role="alert">
                There were errors in the form. Please fix them and try again.
            </div>
        <?php endif; ?>

        <div class="row form-group">
            <div class="col-md-12">
                <input type="name" class="form-control" name="name" id="name" placeholder="Full Name" required>
                <span class="text-danger"><?php echo $nameErr; ?></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-12">
                <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                <span class="text-danger"><?php echo $emailErr; ?></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-12">
                <input type="password" class="form-control" name="inputPassword" id="inputPassword" placeholder="Password" required>
                <span class="text-danger"><?php echo $passwordErr; ?></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-12">
                <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
                <span class="text-danger"><?php echo $confpasswordErr; ?></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-12">
                <input type="tel" class="form-control" name="contactNo" placeholder="Contact No." required>
                <span class="text-danger"><?php echo $phoneErr; ?></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-12">
                <input type="address" class="form-control" name="address" placeholder="Address" required>
                <span class="text-danger"><?php echo $addrErr; ?></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-10">
                <button name="reg_submit" class="btn btn-primary">Sign Up</button>
            </div>
        </div>
    </center>
</form>
