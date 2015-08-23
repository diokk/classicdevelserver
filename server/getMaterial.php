<?php


$con = mysql_connect("localhost","root","");
if (!$con)
{
	die('could not connect:'.mysql_error());
}
mysql_select_db("classic",$con);

//$username = $_POST['username'];
//$password= $_POST['password'];
$matkulid='mk1010';

$result = mysql_query("select * from material where idCourse = '$matkulid'");
while($row = mysql_fetch_assoc($result))
{
	$db_materi[]=$row;
}
//$data= json_encode($db_lecturer);
//echo $data;
$arrayName = array('status' => true, 'data_materi' => $db_materi);
echo json_encode($arrayName);

mysql_close($con);

?>