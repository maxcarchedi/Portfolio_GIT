<!DOCTYPE html>
<html>

<body>

<?php


$conn=mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26", "i308u18_team26");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sanmajor = mysqli_real_escape_string($conn, $_POST['9a']);

$sql = "select m.name,d.name as dname,m.requirehourearn,m.requireoverallgpa
from major as m, department as d
where d.departmentid = m.departmentid and m.majorid = $sanmajor;";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    echo "<table border=1>
 <tr>
 <th>major</th>
 <th>department</th>
 <th>hourrequire</th>
 <th>requireoverallgpa</th>
 </tr>";

    while($row = mysqli_fetch_assoc($result)) {
    echo "<tr>
  <td>".$row["name"]."</td>
  <td>".$row["dname"]."</td>
  <td>".$row["requirehourearn"]."</td>
  <td>".$row["requireoverallgpa"]."</td>
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