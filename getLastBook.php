<?php
require_once('conn.php');

$id = $_POST['id'];

$query = "SELECT * FROM book WHERE user_id='$id' ORDER BY record DESC";

$sql = mysqli_query($db_connect, $query);

if($sql)
{
    $result = mysqli_fetch_assoc($sql);
    header('Content-Type: text/json');
    echo json_encode(array('Details' => $result, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>