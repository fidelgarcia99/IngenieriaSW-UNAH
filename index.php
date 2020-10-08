<?php
    require('php/config.php');
    if(isset($_GET['view']) && !empty($_GET['view'])){
        $page = $html . $_GET['view'] . '.php';
        if(!(include $page)){
            include($html . '404.php');
        }
    }else{
        include($html .'index.php');
    }
?>