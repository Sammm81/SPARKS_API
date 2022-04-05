<?php
require_once('conn.php');
require_once('helper.php');

$id = getId();
$name = $_POST["name"];
$email = $_POST["email"];
$password = md5($_POST["password"]);

$query = "INSERT INTO users (id, name, email, password) VALUES ('$id', '$name', '$email', '$password')";

$response = array(
    "id"=>$id,
    "name"=>$name,
    "email"=>$email
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