<?php
require_once('conn.php');

$id = $_POST['id'];
$paid = $_POST['paid'];

$query = "UPDATE payment SET paid='$paid' WHERE id='$id'";

if(mysqli_query($db_connect, $query))
{
    header('Content-Type: text/json');
    echo json_encode(array('Details' => 'Payment with id = '.$id.' has been paid', 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>