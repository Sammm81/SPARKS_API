<?php
require_once('conn.php');

$paymentId = $_POST['payment_id'];

$query = "SELECT p.id, p.paid, b.verified, s.slot_name, a.area_name, pl.place_name FROM payment p JOIN book b ON p.book_id=b.id JOIN users u ON b.user_id=u.id JOIN slot s ON b.slot_id=s.id JOIN area a ON s.area_id=a.id JOIN place pl ON a.place_id=pl.id WHERE p.id='$paymentId'";
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