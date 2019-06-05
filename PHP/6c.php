<!DOCTYPE html>
<html>

<body>

<?php


$conn=mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26", "i308u18_team26");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sanbuilding= mysqli_real_escape_string($conn, $_POST['6c']);
$santime = mysqli_real_escape_string($conn, $_POST['time']);



$sql = "

select distinct concat(st.last_name,',', st.first_name) as name
from student as st, section as sec, classroom as r, building as b, studentsection as ss
where st.studentid = ss.studentid and sec.sectionid = ss.sectionid and  sec.classroomid = r.classroomid 
and r.buildingid = $sanbuilding and '$santime' between sec.starttime and sec.endtime

union 

select distinct concat(e.lastname,',', e.firstname) as name
from faculty as e, classroom as r, studentsection as ss, section as sec, facultyroom as er
where e.employeeid = er.employeeid and r.classroomid = er.classroomid and r.buildingid = $sanbuilding

union

select distinct concat(e.lastname,',', e.firstname) as name
from faculty as e, classroom as r, building as b, studentsection as ss, section as sec, facultyroom as er
where e.employeeid = sec.employeeid and er.classroomid = r.classroomid 
and r.buildingid = $sanbuilding and '$santime' between sec.starttime and sec.endtime

";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    echo "<table border=1>
	<tr>
	<th>Name</th>
	</tr>";

    while($row = mysqli_fetch_assoc($result)) {
    echo "<tr>
	<td>".$row["name"]."</td>
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

