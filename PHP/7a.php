<!DOCTYPE html>
<html>

<body>

<?php


$conn=mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26", "i308u18_team26");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sanemployeeid = mysqli_real_escape_string($conn, $_POST['7a']);

$sql = "

select distinct s.first_name, s.last_name, m.name as major
from student as s, major as m, Student_major as sm, faculty as e, studentad as sa
where s.studentid=sm.studentid  AND sm.majorid=m.majorid AND sa.employeeid = e.employeeid AND sa.studentid = s.studentid AND sa.employeeid = $sanemployeeid order by s.last_name,s.first_name;";




$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
echo "<table><tr><th>First Name</th><th>Last Name</th><th>Major</th></tr>";

while($row = $result->fetch_assoc()) {
echo "<tr><td>".$row["first_name"]."</td><td>".$row["last_name"]."</td><td>".$row["major"]."</td></tr>";
}
echo "</table>";
} else {
echo "0 results";
}
mysqli_close($conn);
?> 

</body>
</html>