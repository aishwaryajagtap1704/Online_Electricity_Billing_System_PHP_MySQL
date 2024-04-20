<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>

    <!-- Include your CSS stylesheets or external libraries here -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <link href="assets/css/main.css" rel="stylesheet">

    <!-- Add any additional styles for success.php -->
    <style>
        body {
            padding-top: 50px;
        }

        .navbar {
            margin-bottom: 0;
        }

        .navbar-brand {
            font-size: 24px;
        }

        .container {
            margin-top: 50px;
        }

        h2 {
            color: #333;
        }

        p {
            color: #555;
        }

        a {
            color: #337ab7;
        }
    </style>
</head>

<body>

    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.php"><b>E-Billing System</b></a>
            </div>
            <div class="navbar-collapse collapse">
                <!-- Include the login form here if needed -->
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>

    <div class="container">
        <div>
            <h2>Registration Successful!</h2>
            <p>Your account has been created successfully. You can now <a href="login1.php">login</a> to your account.</p>
            <!-- You can add more content or links as needed -->
        </div>
    </div>

    <!--=======================JS=========================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery-1.11.0.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        function validateForm() {
            var x = document.forms["myForm"]["email"].value;
            var atpos = x.indexOf("@");
            var dotpos = x.lastIndexOf(".");
            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
                alert("Not a valid e-mail address");
                return false;
            }
        }
    </script>
</body>

</html>
