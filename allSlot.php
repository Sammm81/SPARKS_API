<?php
require_once('conn.php');

$query = "SELECT * FROM slot";

$sql = mysqli_query($db_connect, $query);

if($sql)
{
    $result = array();
    while ($row = mysqli_fetch_array($sql))
    {
        array_push( $result, array(
            'id' => $row['id'],
            'area_id' => $row['area_id'],
            'name' => $row['name'],
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