<?php
$con=mysqli_connect("db.soic.indiana.edu","i308s18_team26","my+sql=i308s18_team26", "i308s18_team26");

if (mysqli_connect_errno())
	{echo nl2br("Failed to connect to MySQL: " . mysqli_connect_error() . "\n "); }
else 
	{echo nl2br("Established Database Connection \n");}
	
$fname = mysqli_real_escape_string($con, $_POST['firstname']);
$lname = mysqli_real_escape_string($con, $_POST['lastname']);
$dob = mysqli_real_escape_string($con, $_POST['dob']);
$gender = mysqli_real_escape_string($con, $_POST['gender']);

$sql="SELECT * FROM artist";
$result = $con->query($sql);

if($result->num_rows > 0) {
	echo "<table><tr><th>Name</th><th>DOB</th><th>Gender</th></tr>";
	
	while($row = mysqli_fetch_assoc($result)){
		echo "<tr><td>".$row["fname"]." ".$row["lname"]."</td><td>".$row["dob"]."</td><td>".$row["gender"]."</td></tr>";
	}
	echo "</table>";
}	else{
	echo "0 results";
}
