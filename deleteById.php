<?php
require_once('conn.php');

$id = $_POST['id'];
$table = $_POST['table'];

$query = "DELETE FROM $table where id='$id'";

$sql = mysqli_query($db_connect, $query);

if($sql)
{
    header('Content-Type: text/json');
    echo json_encode(array('Details' => 'Data with id = '.$id.' has been deleted', 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>