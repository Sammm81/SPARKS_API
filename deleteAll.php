<?php
require_once('conn.php');

$table = $_POST['table'];

$query = "DELETE FROM $table";

$sql = mysqli_query($db_connect, $query);

if($sql)
{
    $result = 'All data in $table has been deleted';
    header('Content-Type: text/json');
    echo json_encode(array('Details' => $result, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>