<?php
//1. ambil data lecturer dari db
$con=mysql_connect("localhost","root","");
if (!mysql_select_db("classic")) {
    echo "Unable to select mydbname: " . mysql_error();
    exit;
}
echo "<pre>";

$result = mysql_query("SELECT * FROM lecturer");
while ($row = mysql_fetch_assoc($result)) {
    $db_lecturer[]=$row;
}

$course_result = mysql_query("SELECT * FROM course");
while ($row = mysql_fetch_assoc($course_result)) {
	$db_course[]=$row;
}

//ambil json
$raw= file_get_contents("http://localhost/classicserver/server/servicedirect.json");
echo "<pre>";
//ngolah data json biar gak duplicate
$array=json_decode($raw,1);
$array_dosen=array();//
$array_mk=array();

if(count($array)<2){
  echo "json tidak valid";
  exit;
}


foreach ($array as $key => $value) { //hari
	foreach ($value as $key_1 => $value_1) { //ruang
		foreach ($value_1 as $key_2 => $value_2) { //matkul
			if(!array_key_exists($value_2['karyawan_id'], $array_dosen)&& $value_2['karyawan_id']!="")
			{
				$array_dosen[$value_2['karyawan_id']]=$value_2['dosen'];
			}
			if(!array_key_exists($value_2['mk_id'], $array_mk)&& $value_2['mk_id']!="")
			{
				$array_mk[$value_2['mk_id']]=$value_2['matakuliah'];
			}
		}
		//ruang
	} //hari
}

if(count($array_mk)<2){
  echo "json tidak valid";
  exit;
}


if(isset($_GET['reset'])){

	if($_GET['reset']==1){
		mysql_query("truncate table lecturer;");
		mysql_query("truncate table course;");
    mysql_query("truncate table teaching;");

  }
}


$list_idLecture_db=array();
if(isset($db_lecturer)){
	foreach($db_lecturer as $key=>$val){
			$list_idLecture_db[]=$val['idLecturer'];
	}
}

$list_mk_id_db=array();
if(isset($db_course)){
	foreach($db_course as $key_mk=>$val_mk){
		$list_mk_id_db[]=$val_mk['idCourse'];
	}
}



		foreach($array_dosen as $id_dosen=>$nama_dosen)
		{
      if(!in_array($id_dosen, $list_idLecture_db))
			{
				//checking the data that is not in database
				$name_trim			= str_replace(array("."," "), "", $nama_dosen);
				$name_lower			= strtolower($name_trim);
				$fullname			= $nama_dosen;
				$id_lecturer_new	= $id_dosen;
				echo "insert into lecturer (idLecturer,username,pass,fullname) values ('$id_lecturer_new','$name_lower','$name_lower','$fullname')<br>";
				$insert_lecturer = mysql_query("insert into lecturer (idLecturer,username,pass,fullname) values ('$id_lecturer_new','$name_lower','$name_lower','$fullname')");
				//insert ke database
			}

		}

    /*set all MK is_active on database to 0*/
    mysql_query("SET SQL_SAFE_UPDATES = 0;");
    mysql_query("update course set is_active='0' where 1=1;");
		/*syncronize table course*/
    foreach($array_mk as $id_course=>$name_course)
		{
      if(!in_array($id_course, $list_mk_id_db))
			{
				$mk_id_new = $id_course;
				$mk_name_new = $name_course;
				echo "insert into course (idCourse,courseName,is_active) values ('$mk_id_new','$mk_name_new','1')<br>";
				$insert_lecturer = mysql_query("insert into course (idCourse,courseName,is_active) values ('$mk_id_new','$mk_name_new','1')");

			}
      else
      {
          //update old MK ID and still active to 1
          $mk_id_new      = $id_course;
  				$update_sql     = "update course set is_active='1' where idCourse='".$mk_id_new."'";
          $update_aktive  = mysql_query($update_sql);
      }

		}
    /*set all TEACHING is_active on database to 0*/

    mysql_query("SET SQL_SAFE_UPDATES = 0;");
    //mysql_query("update teaching set is_active='0' where 1=1;");
    /*syncronize table teaching*/
		foreach ($array as $key => $value) { //hari
			foreach ($value as $key_1 => $value_1) { //ruang
				foreach ($value_1 as $key_2 => $value_2) { //matkul
					if($value_2['karyawan_id']!=''){
						$sql="select * from teaching where idLecturer='".$value_2['karyawan_id']."' and idCourse='".$value_2['mk_id']."'";
				 		$result=mysql_query($sql);
            $id_teaching=array();
            while ($row = mysql_fetch_assoc($result)) {
                $id_teaching[]=$row;
            }

            if(count($id_teaching)==0){
              $sql="insert into teaching (idTeaching,idCourse,idLecturer) values (NULL,'".$value_2['mk_id']."','".$value_2['karyawan_id']."');";
              echo $sql."<br/>";
              $result=mysql_query($sql);
				 		}
           // else
           // {
              //update old TEACHING ID and still active to 1
            //  $mk_id_new      = $id_course;
      	//			$update_sql     = "update teaching set is_active='1' where idTeaching='".$id_teaching[0]['idTeaching']."'";
          //    $update_aktive  = mysql_query($update_sql);
            //}
				 	}
				}
			}
		}
    /*end of syncronize table teaching*/





		?>
