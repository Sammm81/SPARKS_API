<?php
require_once('conn.php');

$query = "SELECT * FROM area";

$sql = mysqli_query($db_connect, $query);

if($sql)
{
    $result = array();
    while ($row = mysqli_fetch_array($sql))
    {
        array_push( $result, array(
            'id' => $row['id'],
            'place_id' => $row['place_id'],
            'name' => $row['area_name'],
            'full' => $row['full']
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