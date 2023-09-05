<?php 
require_once("include/config.php");
if(!empty($_POST["email"])) {
	$email= $_POST["email"];
	
		$result =mysqli_query($con,"SELECT  email FROM  users WHERE  email='$email'");
		$count=mysqli_num_rows($result);
if($count>0)
{echo "<br>";
echo "<p style='color:red; margin:-10px 0 0 15px;'> Email đã tồn tại</p>";
 echo "<script>$('#submit').prop('disabled',true);</script>";
} else{
	
	echo "<p style='color:green; margin:10px 0 0 15px;'> Email được chập thuận</p>";
 echo "<script>$('#submit').prop('disabled',false);</script>";
}
}


?>
