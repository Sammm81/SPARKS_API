<?php
require_once('conn.php');

$id = $_POST['id'];
$name = $_POST['name'];
$book = $_POST['book'];
$available = $_POST['available'];

$query = "UPDATE slot SET slot_name='$name', book=$book, available=$available WHERE id='$id'";

if(mysqli_query($db_connect, $query))
{
    header('Content-Type: text/json');
    echo json_encode(array('Details' => 'Slot with id = '.$id.' has been succesfully updated', 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>