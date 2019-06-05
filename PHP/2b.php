<!DOCTYPE html>
<html>

<body>

<?php


$conn=mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26", "i308u18_team26");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sanfeature= mysqli_real_escape_string($conn, $_POST['2b']);
$santime = mysqli_real_escape_string($conn, $_POST['time']);



$sql = "select distinct c.classroomid
from classroom as c, classroom_feature as f, section as s 
where c.classroomid = f.classroomid and c.classroomid = s.classroomid and '$santime' between s.starttime and s.endtime and f.feature = '$sanfeature';";


$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    echo "<table border=1>
	<tr>
	<th>Room ID</th>
	</tr>";

    while($row = mysqli_fetch_assoc($result)) {
    echo "<tr>
	<td>".$row["classroomid"]."</td>
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




