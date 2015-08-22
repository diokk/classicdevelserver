<?php


$raw= file_get_contents("http://localhost/classicdevel/server/servicedirect.json");
echo "<pre>";
$array=json_decode($raw,1);
$array_dosen=array();//
$array_mk=array();

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
	}
	//hari
}

//cek array dosen


print_r($array_mk);
?>