<?php


$con = mysql_connect("localhost","root","");
if (!$con)
{
	die('could not connect:'.mysql_error());
}
mysql_select_db("classic",$con);
$all_materi= array();
$db_folder= array();
$db_file= array();

$getCourse = $_POST['idCourse'];
$getParent = $_POST['idParent'];

//$getCourse = $_GET['idCourse'];
//$getParent = $_GET['idParent'];

$folder= "SELECT idFolder, folderName, idCourse, idParent, last_update, (SELECT idParent FROM folder F WHERE folder.idparent = F.idFolder) 
as idGrandParent FROM folder WHERE 1 AND idCourse = '$getCourse' AND idParent = '$getParent'";

$file="SELECT material.idMaterial, material.materialTitle,material.fileName, material.description,material.format,material.size as file_size,
						  material.location,material.idCourse, material.idFolder, material.idLecturer, folder.FolderName, material.last_update
				   FROM material LEFT JOIN folder ON folder.idFolder = material.idFolder WHERE 1 AND material.idCourse = '$getCourse'
				   AND material.idFolder = '$getParent'";

$folder_result= mysql_query($folder);
while($row = mysql_fetch_assoc($folder_result))
{
	$db_folder[]=$row;
}

$file_result= mysql_query($file);
while($row = mysql_fetch_assoc($file_result))
{
	$db_file[]=$row;
}


$all_materi['folder']= $db_folder;
$all_materi['file']=$db_file;

$arrayName = array('status' => true, 'data_all_materi' => $all_materi);

$chunk=array();
foreach($all_materi['folder'] as $key=>$val){
$chunk[]=array("jenis"=>"folder","id_course"=>$val['idCourse'],"id_folder"=>$val['idFolder'],"name"=>$val['folderName'],"description"=>"","location"=>"","format"=>"","size"=>"","last_update"=>$val['last_update']);
}
foreach($all_materi['file'] as $key=>$val){
$chunk[]=array("jenis"=>"file","id_course"=>$val['idCourse'],"id_folder"=>$val['idFolder'],"name"=>$val['materialTitle'],"description"=>$val['description'],"location"=>$val['location'],"format"=>$val['format'],"size"=>$val['file_size'],"last_update"=>$val['last_update']);
}

//echo "<pre>";
//print_r($chunk);
//exit;


//echo "<pre>";
//print_r($arrayName); exit;
echo json_encode($chunk);
mysql_close($con);


?>