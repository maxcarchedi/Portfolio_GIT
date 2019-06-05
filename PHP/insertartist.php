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

$sql="INSERT INTO artist (fname, lname, dob, gender) VALUES ('$fanme', '$lname', '$dob', '$gender')";

if (!mysqli_query($con,$sql))
{ die('Error: ' . mysqli_error($con)); }

else{
	echo "1 record added";
	}
mysqli_close($con);
?>
