<?php
	require "connect.php";
	$mob = $_POST['mob'];
	//$mob = "8586847364";

	$sql = "SELECT u_pass FROM user_details WHERE u_id = '$mob' ";

	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) { 
		 echo $row["u_pass"];
		}
	}else{
		 echo "Err";
	}

	
	$conn->close();
?>
