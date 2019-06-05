<!DOCTYPE html>
<html>

<body>

<?php


$conn=mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26", "i308u18_team26");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sanbuildingid = mysqli_real_escape_string($conn, $_POST['addtion2']);

$sql = "select c.classroomid,c.capacity
from classroom as c, building as b
where c.buildingid = $sanbuildingid and c.capacity > 50;";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
echo "<table><tr><th>classroomid</th><th>capacity</th></tr>";

    while($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row["classroomid"]."</td><td>".$row["capacity"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

mysqli_close($conn);
?> 

</body>
</html>