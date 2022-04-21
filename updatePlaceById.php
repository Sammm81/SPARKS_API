<?php
require_once('conn.php');

$id = $_POST['id'];
$name = $_POST['name'];
$full = $_POST['full'];

$query = "UPDATE place SET place_name='$name', full=$full WHERE id='$id'";

if(mysqli_query($db_connect, $query))
{
    header('Content-Type: text/json');
    echo json_encode(array('Details' => 'Place with id = '.$id.' has been succesfully updated', 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>