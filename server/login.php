<?php


$con = mysql_connect("localhost","root","");
if (!$con)
{
	die('could not connect:'.mysql_error());
}
mysql_select_db("classic",$con);

//$username = $_POST['username'];
//$password= $_POST['pass'];
$username='fajarpradana';
$password='fajarpradana';
//$db_lecturer=array();
$result = mysql_query("select * from Lecturer where username='$username' and pass='$password'");

while($row = mysql_fetch_assoc($result))
{
	$db_lecturer[]=$row;
}
//$data= json_encode($db_lecturer);
//echo $data;
$arrayName = array('status' => true, 'data' => $db_lecturer);
echo json_encode($arrayName);
/*
echo "string";
if(isset($db_lecturer)){
	foreach ($db_lecturer as $key => $value) {
		$arrayName = array('data' => $value['idLecturer']);
		//echo $value['idLecturer'];
		echo json_encode($arrayName);


	}
	
}
*/

mysql_close($con);

?>