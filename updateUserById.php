<?php
require_once('conn.php');

$id = $_POST["id"];
$name = $_POST["name"];
$email = $_POST["email"];
$admin = $_POST["admin"];
$balance = $_POST["balance"];

$query = "UPDATE users SET name='$name', email='$email', admin='$admin', balance='$balance' WHERE id='$id'";

if(mysqli_query($db_connect, $query))
{
    header('Content-Type: text/json');
    echo json_encode(array('Details' => 'User with id = '.$id.' has been succesfully updated', 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>