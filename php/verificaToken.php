<?php 
session_start();
if(!isset($_SESSION['token'])){
    echo '{"mensaje":"Acceso no autorizado"}';
    exit;
}
if(!isset($_COOKIE['token'])){
    echo '{"mensaje":"Acceso no autorizado"}';
    exit;
}
if($_COOKIE['token'] != $_SESSION['token']){
    echo '{"mensaje":"Acceso no autorizado"}';
    exit;
}


?>