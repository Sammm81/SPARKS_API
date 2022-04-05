<?php
    define('HOST', 'Localhost');
    define('USER', 'root');
    define('PASS', '');
    define('DB', 'sparks');

    $db_connect = mysqli_connect( HOST, USER, PASS, DB) or die('gagal konek');
?>