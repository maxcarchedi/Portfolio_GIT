<!doctype html>
<html>
<body>
	<h1>Team26 PHP_page</h1>
	<h3>Select query_1a_(5)</h3>
	<h4>Produce a roster for a *specified section* sorted by student’s last name, first name</h4>
	
	<form action = "1a.php" method = "POST">
	<select name='1a'>
	<?php
	$conn = mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26","i308u18_team26");

	if (!$conn) {
	    die("Connection failed: " . mysqli_connect_error());
	}
	    $result = mysqli_query($conn,"select distinct sectionid from section");

	    while ($row = mysqli_fetch_assoc($result)) {
	                  unset($sectionid);
	                  $sectionid = $row ['sectionid'];
	                  echo '<option value="'.$sectionid.'">'.$sectionid.'</option>';
	}
	?>
    </select>
	<h4> Run Query</h4>
	    <input type = "submit" value = "run_1a">
	</form>
	<h3>Select query_2b_(10)</h3>
	<h4>Produce a list of rooms that are equipped with *some feature*—e.g., “wired instructor
station”—that are available at a particular time.</h4>
	<form action = "2b.php" method = "POST">
	<select name='2b'>
	
	<?php
	$conn = mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26","i308u18_team26");

	if (!$conn) {
	    die("Connection failed: " . mysqli_connect_error());
	}
	    $result = mysqli_query($conn,"select distinct feature from classroom_feature");

	    while ($row = mysqli_fetch_assoc($result)) {
	                  unset($classroomid,$feature);
	                  $feature = $row['feature'];
	                  echo '<option value="'.$feature.'">'.$feature.'</option>';
	}
	?> 
	</select>
	Time: <input type="time" name="time"><br><br>
	
	<h4> Run Query</h4>
	    <input type = "submit" value = "run_2b">
	</form>
	
		<h3>Select query_6C_(15)</h3>
		<h4>Produce a list of students and faculty who were in a *particular building* at a *particular
time*. Also include in the list faculty and advisors who have offices in that building.</h4>
		<form action = "6c.php" method = "POST">
		<select name='6c'>
	
		<?php
		$conn = mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26","i308u18_team26");

		if (!$conn) {
		    die("Connection failed: " . mysqli_connect_error());
		}
   	 	$result = mysqli_query($conn,"SELECT distinct buildingid, name from building");
	
    	while ($row = mysqli_fetch_assoc($result)) {
                  unset($buildingid, $name);
				  $name = $row['name'];
                  $buildingid = $row['buildingid'];
				  echo '<option value="'.$buildingid.'">'.$name.'</option>';
		}
		?> 
		</select>
		Time: <input type="time" name="time">
	
		<h4> Run Query</h4>
		    <input type = "submit" value = "run_6c">
		</form>
	
			<h3>Select query_7a_(5)</h3>
			<h4>PProduce an alphabetical list of students with their majors who are advised by a
*specified advisor*</h4>
			<form action = "7a.php" method = "POST">
			<select name='7a'>
	
			<?php
			$conn = mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26","i308u18_team26");

			if (!$conn) {
			    die("Connection failed: " . mysqli_connect_error());
			}
    $result = mysqli_query($conn,"select concat(firstname,' ',lastname) as name, employeeid from faculty");

    while ($row = mysqli_fetch_assoc($result)) {
                  unset($employeeid,$name);
                  $employeeid = $row ['employeeid'];
                  $name = $row ['name'];
                  echo '<option value="'.$employeeid.'">'.$name.'</option>';
			}
			?> 
			</select>
	
			<h4> Run Query</h4>
			    <input type = "submit" value = "run_7a">
			</form>
		
		
				<h3>Select query_3b_(10)</h3>
				<h4>Produce a list of faculty who have never taught a *specified course*.</h4>
				<form action = "3b.php" method = "POST">
				<select name='3b'>
	
				<?php
				$conn = mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26","i308u18_team26");

				if (!$conn) {
				    die("Connection failed: " . mysqli_connect_error());
				}

    $result = mysqli_query($conn,"SELECT distinct courseid, title from course");
	
    while ($row = mysqli_fetch_assoc($result)) {
                  unset($courseid,$title);
                  $courseid = $row['courseid'];
				  $title = $row['title'];
				  echo '<option value="'.$courseid.'">'.$title.'</option>';
				}
				?> 
				</select>
	
				<h4> Run Query</h4>
				    <input type = "submit" value = "run_3b">
				</form>	
	<br>
			<h3>Select query_9a_(5)</h3>
			<h4>Produce a list of majors offered, along with the department that offers them and their
requirements to graduate (hours earned and overall GPA).</h4>
				
			<form action = "9a.php" method = "POST">
			<select name='9a'>
	
			<?php
			$conn = mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26","i308u18_team26");

			if (!$conn) {
			    die("Connection failed: " . mysqli_connect_error());
			}
    $result = mysqli_query($conn,"select majorid,name from major");

    while ($row = mysqli_fetch_assoc($result)) {
                  unset($majorid,$name);
                  $majorid = $row ['majorid'];
                  $name = $row ['name'];
                  echo '<option value="'.$majorid.'">'.$name.'</option>';
			}
			?> 
			</select>
	
			<h4> Run Query</h4>
			    <input type = "submit" value = "run_9a">
			</form>				
				
			<h3>Select query addtion1</h3>
			<h4>Produce a list of rooms that are equipped with *some feature*</h4>
				
			<form action = "addtion1.php" method = "POST">
			<select name='addtion1'>
	
			<?php
			$conn = mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26","i308u18_team26");

			if (!$conn) {
			    die("Connection failed: " . mysqli_connect_error());
			}
    $result = mysqli_query($conn,"select distinct feature from classroom_feature");

    while ($row = mysqli_fetch_assoc($result)) {
                  unset($feature);
                  $feature = $row ['feature'];
                  echo '<option value="'.$feature.'">'.$feature.'</option>';
			}
			?> 
			</select>
	
			<h4> Run Query</h4>
			    <input type = "submit" value = "run_addtion1">
			</form>			
			
			
			<h3>Select query addtion2</h3>
			<h4>Show classroom number and what building it is located in when people > 50</h4>
			
			<form action = "addtion2.php" method = "POST">
			<select name='addtion2'>
			
					<?php
					$conn = mysqli_connect("db.soic.indiana.edu","i308u18_team26","my+sql=i308u18_team26","i308u18_team26");

					if (!$conn) {
					    die("Connection failed: " . mysqli_connect_error());
					}
		    $result = mysqli_query($conn,"select buildingid, name from building");
			
		    while ($row = mysqli_fetch_assoc($result)) {
		                  unset($buildingid);
		                  $buildingid = $row ['buildingid'];
						  $name = $row ['name'];
		                  echo '<option value="'.$buildingid.'">'.$name.'</option>';
					}
					?>
						  
			</select>
	
			<h4> Run Query</h4>
			    <input type = "submit" value = "run_addtion2">
			</form>

</body>
</html>