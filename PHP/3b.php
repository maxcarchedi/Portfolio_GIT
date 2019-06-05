<!DOCTYPE html>
<html>

<body>

<?php


$conn=mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26", "i308u18_team26");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sancourse = mysqli_real_escape_string($conn, $_POST['3b']);



$sql = "select distinct e.lastname, e.firstname
from faculty as e, course as c, section as s
where c.courseid = $sancourse and s.employeeid <> e.employeeid
and s.courseid = c.courseid
Order by e.lastname

"
;
$result = mysqli_query($conn,$sql);
if (mysqli_num_rows($result) > 0) {
    echo "<table border=1>
	<tr>
	<th>Last Name</th>
	<th>First Name</th>
	</tr>";

    while($row = mysqli_fetch_assoc($result)) {
    echo "<tr>
	<td>".$row["lastname"]."</td>
	<td>".$row["firstname"]."</td>
	</tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}
mysqli_close($conn);
?> 

</body>
</html>