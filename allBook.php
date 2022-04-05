<?php
require_once('conn.php');

$query = "SELECT * FROM book";

$sql = mysqli_query($db_connect, $query);

if($sql)
{
    $result = array();
    while ($row = mysqli_fetch_array($sql))
    {
        array_push( $result, array(
            'id' => $row['id'],
            'user_id' => $row['user_id'],
            'slot_id' => $row['slot_id'],
            'token' => $row['token'],
            'verified' => $row['verified'],
            'record' => $row['record']
        ));
    }

    echo json_encode(array('Details' => $result, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>