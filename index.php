<?php
    require('php/config.php');
    require_once VENDOR.'autoload.php';
    if(isset($_GET['view']) && !empty($_GET['view'])){
        $page = HTML . $_GET['view'] . '.php';
        if(!(include $page)){
            include(HTML . '404.php');
        }
    }else{
        include(HTML .'index.php');
    }
?>