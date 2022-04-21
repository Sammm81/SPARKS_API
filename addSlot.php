<?php
require_once('conn.php');
require_once('helper.php');

$id = getId();
$area_id = $_POST['area_id'];
$name = $_POST['name'];

$query = "INSERT INTO slot (id, area_id, slot_name) VALUES ('$id', '$area_id', '$name')";

$response = array(
    "id"=>$id,
    "area_id"=>$area_id,
    "name"=>$name
);


if(mysqli_query($db_connect, $query))
{
    header('Content-Type: text/json');
    echo json_encode(array('Details' => $response, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>