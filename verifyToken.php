<?php
require_once('conn.php');

$token = $_POST['token'];
$arr = str_split($token, 10);

$query = "SELECT * FROM book WHERE user_id='$arr[1]' AND slot_id='$arr[0]'";
$sql = mysqli_query($db_connect, $query);

if($sql)
{
    header('Content-Type: text/json');
    echo json_encode(array('Details' => 'Token Verified!', 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>