<?php

function getId() {
    $id = uniqid();
    
    $result = substr($id, -10);

    return $result;    
}

function generateToken($slot_id, $user_id){
    return $slot_id . $user_id;
}

?>