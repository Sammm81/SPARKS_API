<?php
require_once('conn.php');

$id = $_POST['id'];
$area_id = $_POST['area_id'];
$name = $_POST['name'];

$query = "INSERT INTO slot (id, area_id, name) VALUES ('$id', '$area_id', '$name')";

$response = array(
    "id"=>$id,
    "area_id"=>$area_id,
    "name"=>$name
);


if(mysqli_query($db_connect, $query))
{
    echo json_encode(array('Details' => $response, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>