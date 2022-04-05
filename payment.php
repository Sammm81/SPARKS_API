<?php
require_once('conn.php');
require_once('helper.php');

$id = getId(10);
$book_id = $_POST['book_id'];

$query = "INSERT INTO payment (id, book_id) VALUES ('$id', '$book_id')";

$response = array(
    "id"=>$id,
    "book_id"=>$book_id
);


if(mysqli_query($db_connect, $query))
{
    echo json_encode(array('Details' => $response, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>