<?php
//Configuracion del proyecto
    define('TITULO','Autoservicios el Boulevard');

//Base de datos
    define('DB_USER','b70fe44c3564d1');
    define('DB_SERVER','us-cdbr-east-02.cleardb.com');
    define('DB_PASSWORD','d5d097f7');
    define('DB_NAME','heroku_a16e5753c5ce081');
    define('DB_PORT','3036');

   // mysql://b70fe44c3564d1:d5d097f7@us-cdbr-east-02.cleardb.com/heroku_a16e5753c5ce081?reconnect=true
//Rutas para utilizar en las paginas
    define('CSS','css/');
    define('IMG','img/');
    define('JS','js/');
    define('APIS','php/api/');
    define('CLASES','php/clases/');
    define('SCSS','scss/');
    define('VENDOR','vendor/');
    define('HTML','html/');
    define('SECCIONES','html/secciones/');

//Generacion de tokens con JWT
    define('SECRETKEY','IS-IIIPAC-2020');
    define('TIEMPOTOKEN',3600);
    define('ENCRYPT',['HS256']);
    //$encrypt = ['HS256'];    
?>
