<?php
require_once('conn.php');

$id = $_POST['id'];
$verified = $_POST['verified'];

$query = "UPDATE book SET verified='$verified' WHERE id='$id'";

if(mysqli_query($db_connect, $query))
{
    header('Content-Type: text/json');
    echo json_encode(array('Details' => 'Book with id = '.$id.' has been verified', 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>