<?php
function verificaToken(){
    if(!isset($_SESSION['token'])){
        echo '{"mensaje":"Acceso no autorizado. No session iniciada"}';
        exit;
    }
    if(!isset($_COOKIE['token'])){
        echo '{"mensaje":"Acceso no autorizado. No coockie creada"}';
        exit;
    }
    if($_COOKIE['token'] != $_SESSION['token']){
        echo '{"mensaje":"Acceso no autorizado. Session y cookie no coinciden"}';
        exit;
    }
    try {
        JWTokens::validaToken($_COOKIE['token']);
    } catch (Exception $e) {
        echo '{"mensaje":"Acceso no autorizado. Token invalido"}';
        exit;
    }
}

?>
