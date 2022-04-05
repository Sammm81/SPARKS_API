<?php
require_once('conn.php');

$query = "SELECT * FROM users";

$sql = mysqli_query($db_connect, $query);

if($sql)
{
    $result = array();
    while ($row = mysqli_fetch_array($sql))
    {
        array_push( $result, array(
            'id' => $row['id'],
            'name' => $row['name'],
            'email' => $row['email'],
            'password' => $row['password'],
            'admin' => $row['admin'],
            'balance' => $row['balance']
        ));
    }

    echo json_encode(array('Details' => $result, 'Message' => 'Success'));
}
else
{
    echo json_encode(array('Details' => mysqli_error($db_connect), 'Message' => 'Failed'));
}

?>