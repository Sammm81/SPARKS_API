<?php
require_once('conn.php');
require_once('helper.php');

$id = getId(10);
$user_id = $_POST['user_id'];
$slot_id = $_POST['slot_id'];
$token = generateToken($slot_id, $user_id);

$query = "INSERT INTO book (id, user_id, slot_id, token) VALUES ('$id', '$user_id', '$slot_id', '$token')";

$response = array(
    "id"=>$id,
    "user_id"=>$user_id,
    "slot_id"=>$slot_id,
    "token"=>$token
);


if(mysqli_query($db_connect, $query))
{
    header('Content-Type: text/json');
    echo json_encode(array('Details' => $response, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>