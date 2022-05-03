<?php
require_once('conn.php');

$id = $_POST['id'];

$query = "SELECT p.place_name, a.area_name, s.slot_name, book, verified FROM book b JOIN users u ON b.user_id = u.id JOIN slot s ON b.slot_id = s.id JOIN area a ON s.area_id = a.id JOIN place p ON a.place_id = p.id WHERE u.id = '$id' ORDER BY b.record DESC";
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