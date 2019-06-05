<!DOCTYPE html>
<html>

<body>

<?php


$conn=mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26", "i308u18_team26");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sansectionid = mysqli_real_escape_string($conn, $_POST['1a']);

$sql = "select distinct s.last_name, s.first_name
from student as s, section as sn, studentsection as ss
where s.studentid = ss.studentid and sn.sectionid = ss.sectionid AND ss.sectionid = $sansectionid;";


$result = mysqli_query($conn, $sql);


if (mysqli_num_rows($result) > 0) {
    echo "<table border=1>
	<tr>
	<th>Student Last Name</th>
	<th>Student First Name</th>
	</tr>";

    while($row = mysqli_fetch_assoc($result)) {
    echo "<tr>
	<td>".$row["last_name"]."</td>
	<td>".$row["first_name"]."</td>
	</tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$mysqli_close($conn);
?>
</body>
</html>