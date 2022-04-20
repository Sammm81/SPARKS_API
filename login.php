<?php
require_once('conn.php');
require_once('helper.php');

$email = $_POST["email"];
$password = md5($_POST["password"]);

$query = "SELECT * FROM users WHERE email='$email' AND password='$password'";

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