<?php

$conn = mysqli_connect("localhost","root","","ihosting_r2g");

//if($conn){
//    echo "Connection successful!";
//}else{
//    echo "Connection fail!";
//}
$id = "100";

$query = 'SELECT * FROM extras';

$stmt = $conn->prepare($query);
$stmt->execute();
$extras = $stmt->get_result();
$json = array();
$room = array();
while($extra = mysqli_fetch_array($extras)){
    $temp = array();
    $pattern = "/\b".$id."\b/";
    if(preg_match($pattern,$extra['room_types'])){
        $temp['id'] = $extra['id'];
        $temp['name'] = $extra['name'];
        $temp['desc'] = $extra['description'];
        $temp['room_types'] = $extra['room_types'];
        $temp['charge_value'] = $extra['charge_value'];
        $temp['maximum_qty'] = $extra['maximum_qty'];
        array_push($json,$temp);
    }
   
    
    
}
$room['id']="Whatever";
$room['extras']=$json;
var_dump($room);

?>