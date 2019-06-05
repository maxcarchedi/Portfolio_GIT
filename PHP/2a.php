<!DOCTYPE html>
<html>

<body>

<?php


$conn=mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26", "i308u18_team26");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sanfeature = mysqli_real_escape_string($conn, $_POST['2a']);

$sql = "select c.classroomid
from classroom as c, classroom_feature as f
where c.classroomid = f.classroomid and f.feature = '$sanfeature';";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
echo "<table><tr><th>Room id</th></tr>";

    while($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row["classroomid"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

mysqli_close($conn);
?> 

</body>
</html>