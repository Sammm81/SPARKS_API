<?php
require_once('conn.php');
require_once('helper.php');

$id = getId();
$name = $_POST["name"];

$query = "INSERT INTO place (id, place_name) VALUES ('$id', '$name')";

$response = array(
    "id"=>$id,
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