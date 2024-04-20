<?php 
    require_once('head_html.php'); 
    require_once('../Includes/config.php'); 
    require_once('../Includes/session.php'); 
    require_once('../Includes/admin.php');
    
    // Redirect to login if not logged in
    if ($logged == false) {
        header("Location:../index.php");
    } 
    
    // Handle Search Form Submission
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $searchEmail = mysqli_real_escape_string($con, $_POST['email']);
        $searchContact = mysqli_real_escape_string($con, $_POST['contact']);

        $query = "SELECT * FROM user WHERE email LIKE '%$searchEmail%' AND phone LIKE '%$searchContact%'";
        $result = mysqli_query($con, $query);

        // Store search results in a session variable
        $_SESSION['searchResults'] = [];
        while($row = mysqli_fetch_assoc($result)){
            $_SESSION['searchResults'][] = $row;
        }
    }

    // Check if a search has been performed
    $searchResults = isset($_SESSION['searchResults']) ? $_SESSION['searchResults'] : [];

    // Clear the search results after displaying them
    unset($_SESSION['searchResults']);
?>

<body>

    <div id="wrapper">
    
        <?php 
            require_once("nav.php");
            require_once("sidebar.php");
        ?>

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Customer
                            <small>Details</small>
                        </h1>
                        
                        <!-- Search Form -->
                        <form method="post" class="form-inline" id="searchForm">
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="text" class="form-control" id="email" name="email" placeholder="Enter Email">
                            </div>
                            <div class="form-group">
                                <label for="contact">Contact:</label>
                                <input type="text" class="form-control" id="contact" name="contact" placeholder="Enter Contact">
                            </div>
                            <button type="submit" class="btn btn-default">Search</button>
                        </form>
                        <!-- End Search Form -->
                        
                        <!-- Print Button -->
                        <button class="btn btn-default" onclick="window.print()">Print</button>
                        
                        <!-- Display Search Results or Existing Table -->
                        <?php if (!empty($searchResults)) { ?>
                            <div class="table-responsive" style="padding-top: 20px">
                                <?php if (count($searchResults) > 0) { ?>
                                    <h3>Search Results</h3>
                                    <table class="table table-hover table-bordered table-condensed">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Contact</th>
                                                <th>Address</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                                $cnt = 1;
                                                foreach ($searchResults as $row) {
                                            ?>
                                                <tr>
                                                    <td height="50"><?php echo $cnt; ?></td>
                                                    <td><?php echo $row['name'] ?></td>
                                                    <td><?php echo $row['email'] ?></td>
                                                    <td><?php echo $row['phone'] ?></td>
                                                    <td><?php echo $row['address'] ?></td>                                                    
                                                </tr>
                                            <?php $cnt++; } ?>
                                        </tbody>
                                    </table>
                                <?php } else { ?>
                                    <p>No results found for the given email or contact.</p>
                                <?php } ?>
                            </div>
                        <?php } else { ?>
                            <!-- Display Existing Table -->
                            <ol class="breadcrumb">
                                <li>User</li>
                                <li class="active">Details</li>
                            </ol>
                            <div class="table-responsive" style="padding-top: 0">
                                <table class="table table-hover table-bordered table-condensed">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Contact</th>
                                            <th>Address</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                            $query = "SELECT * FROM user";
                                            $result = mysqli_query($con, $query);
                                            $cnt = 1;
                                            while($row = mysqli_fetch_assoc($result)){
                                            ?>
                                                <tr>
                                                    <td height="50"><?php echo $cnt; ?></td>
                                                    <td><?php echo $row['name'] ?></td>
                                                    <td><?php echo $row['email'] ?></td>
                                                    <td><?php echo $row['phone'] ?></td>
                                                    <td><?php echo $row['address'] ?></td>                                                    
                                                </tr>
                                            <?php $cnt++; } ?>
                                    </tbody>
                                </table>
                            </div>
                            <!-- ./table -rsponsive -->
                        <?php } ?>
                        <!-- End Display Search Results or Existing Table -->
                        
                    </div><!-- ./col -->

                </div> <!-- /.row -->

            </div><!-- /.container-fluid -->

        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
    

<?php 
   
    require_once("js.php");
?>

</body>

</html>
