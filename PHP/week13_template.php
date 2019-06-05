<?php
// Create connection
$conn = mysqli_connect("db.soic.indiana.edu","i308_data","my+sql=i308_data","i308_dataset");

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Grab Roles
$roles = mysqli_real_escape_string($conn, $_POST['roles']);
$order_date = mysqli_real_escape_string($conn, $_POST['order_date']);
$order_time = mysqli_real_escape_string($conn, $_POST['order_time']);
$sql = "SELECT * from works_shift where role = '$roles' AND wdate = '$order_date' AND '$order_time' BETWEEN time_in AND time_out";
$result = mysqli_query($conn, $sql);
$num_rows = mysqli_num_rows($result);

// Print Table
if ($result->num_rows > 0) {
    echo "<table>";
	echo "<tr><th>Shift ID</th><th>Employee ID</th><th>wdate</th><th>time_in</th><th>time_out</th><th>role</th></tr>";
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row["shiftid"]."</td><td>".$row["empid"]."</td><td>".$row["wdate"]."</td>
		      <td>".$row["time_in"]."</td><td>".$row["time_out"]."</td><td>".$row["role"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

// Print Num Rows
echo "$num_rows Rows\n";

// Close Connection
mysqli_close($conn);
?>
