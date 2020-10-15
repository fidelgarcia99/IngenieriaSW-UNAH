<?php 
    session_start();
    if(!isset($_SESSION['token'])){
        header('Location: ?view=login');
    }
    if(!isset($_COOKIE['token'])){
        header('Location: ?view=login');
    }
    if($_COOKIE['token'] != $_SESSION['token']){
        header('Location: ?view=401');
    }
?>