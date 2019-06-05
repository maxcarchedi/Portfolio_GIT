<?php
$con=mysqli_connect("db.soic.indiana.edu","i308s18_team26","my+sql=i308s18_team26", "i308s18_team26");

if (mysqli_connect_errno())
	{echo nl2br("Failed to connect to MySQL: " . mysqli_connect_error() . "\n "); }
else 
	{echo nl2br("Established Database Connection \n");}

$sanbname = mysqli_real_escape_string($con, $_POST['bandname']);
$sanyearf = mysqli_real_escape_string($con, $_POST['yearformed']);

$sql="INSERT INTO band (name, year_formed) VALUES ('$sanbname', '$sanyearf')";
$result = $con->query($sql);

if (!mysqli_query($con,$sql))
{ die('Error: ' . mysqli_error($con)); }

else{
	echo "1 record added";
	}

if($result->num_rows > 0) {
	while($row = mysqli_fetch_assoc($result)){
		echo $row["name"]. $row["year_formed"];
	}
}	else{
	echo "0 results";
}
mysqli_close($con);
?>
