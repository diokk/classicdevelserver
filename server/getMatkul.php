<?php


$con = mysql_connect("localhost","root","");
if (!$con)
{
	die('could not connect:'.mysql_error());
}
mysql_select_db("classic",$con);

$id=$_POST['id'];

$result = mysql_query("select c.idCourse, c.courseName from Course c, Lecturer l, Teaching t where t.idLecturer='$id' and t.idCourse= c.idCourse and l.idLecturer=t.idLecturer");
while($row = mysql_fetch_assoc($result))
{
	$db_mk[]=$row;
}

$arrayName = array('status' => true, 'data_mk' => $db_mk);
echo json_encode($arrayName);
mysql_close($con);

?>