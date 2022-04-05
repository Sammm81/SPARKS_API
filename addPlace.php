<?php
require_once('conn.php');

$id = $_POST['id'];
$name = $_POST["name"];

$query = "INSERT INTO place (id, name) VALUES ('$id', '$name')";

$response = array(
    "id"=>$id,
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