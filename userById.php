<?php
require_once('conn.php');

$id = $_GET['id'];

$query = "SELECT * FROM users where id='$id'";

$sql = mysqli_query($db_connect, $query);

if($sql)
{
    $result = mysqli_fetch_assoc($sql);
    echo json_encode(array('Details' => $result, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>