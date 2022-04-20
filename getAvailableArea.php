<?php
require_once('conn.php');

$place_id = $_POST['place_id'];

$query = "SELECT a.id, p.place_name, a.area_name, a.full  FROM area a JOIN place p ON a.place_id = p.id WHERE p.id='$place_id' AND a.full = 0";

$sql = mysqli_query($db_connect, $query);


if($sql)
{
    $result = array();
    while ($row = mysqli_fetch_assoc($sql))
    {
        array_push( $result, array(
            'area_id' => $row['id'],
            'place_name' => $row['place_name'],
            'area_name' => $row['area_name'],
            'full' => $row['full'],
        ));
    }

    header('Content-Type: text/json');
    echo json_encode(array('Details' => $result, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>