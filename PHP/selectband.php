<?php
$con=mysqli_connect("db.soic.indiana.edu","i308s18_team26","my+sql=i308s18_team26", "i308s18_team26");

if (mysqli_connect_errno())
	{echo nl2br("Failed to connect to MySQL: " . mysqli_connect_error() . "\n "); }
else 
	{echo nl2br("Established Database Connection \n");}
	
$sanbname = mysqli_real_escape_string($con, $_POST['bandname']);
$sanyearf = mysqli_real_escape_string($con, $_POST['yearformed']);

$sql="SELECT * FROM band";
$result = $con->query($sql);

if($result->num_rows > 0) {
	echo "<table><tr><th>Name</th><th>Year Formed</th></tr>";
	
	while($row = mysqli_fetch_assoc($result)){
		echo "<tr><td>".$row["name"]."</td><td>".$row["year_formed"]."</td></tr>";
	}
	echo "</table>";
}	else{
	echo "0 results";
}