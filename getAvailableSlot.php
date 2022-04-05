<?php
require_once('conn.php');

$area_id = $_POST['area_id'];

$query = "SELECT s.id, s.slot_name, s.available, s.book, a.area_name FROM slot s JOIN area a ON s.area_id = a.id WHERE a.id='$area_id' AND s.available = 1 AND s.book = 0";

$sql = mysqli_query($db_connect, $query);


if($sql)
{
    $result = array();
    while ($row = mysqli_fetch_array($sql))
    {
        array_push( $result, array(
            'slot_id' => $row['id'],
            'slot_name' => $row['slot_name'],
            'area_name' => $row['area_name'],
            'book' => $row['book'],
            'available' => $row['available']
        ));
    }

    echo json_encode(array('Details' => $result, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>