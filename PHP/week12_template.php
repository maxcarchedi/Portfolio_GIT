<?php
//Step 2.1 - Remove this comment when done
$con=mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26", "i308u18_team26");
// Check connection
if (!$con)
	{die("Failed to connect to MySQL: " . mysqli_connect_error() ); }
else 
	{ echo "Established Database Connection" ;}
	
//Step 2.2 - Uncomment the following when instructed by removing the /* and the */ below.

$varcname = $_POST['cname'];
$varaddress = $_POST['address'];
$varphone = $_POST['phone'];

$sql="INSERT INTO customer (name, address, phone)
VALUES('$varcname','$varaddress','$varphone')";
if (mysqli_query($con, $sql))
	{echo "1 record added";}
Else
	{ die('SQL Error: ' . mysqli_error($con)); }
mysqli_close($con);
?>