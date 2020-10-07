
<!DOCTYPE html>
<html lang="es">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <!-- Favicons -->
        <link href="images/llanta.jpg" rel="icon" >
        <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
    
    <title>TecniWash</title>
    <!--css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/jquery.pagepiling.min.css" />
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/tabla.css">
   
    <!---logo del titulo-->
    <!-- <link rel="shortcut icon" href="images/favicon.ico" /> -->
</head>


<body>
    <div id="pagepiling" class="imgBg">
        <!-- inicio Preloader -->
        <div class="preloader">
            <div class="preloader-img"></div>
        </div>
        <!-- final Preloader -->


        <!--inicio Header-->
        <header>
            <div class="logo-area">
                <a href="index.html" class="logo">
                    <img src="images/logo.png" alt="logo">
                </a>
            </div>
            <div class="header-info-area">
                <a class="info-btn" id="header-info-btn" href="#header-info-bar">
                    <span class="top"></span>
                    <span class="middle"></span>
                    <span class=bottom></span>
                </a>
                <div id="header-info-bar">
                    <div class="close-animatedModal close-header-info-bar">
                        <i class="fas fa-times"></i>
                    </div>
                    <div class="modal-content">
                         <!--inicio area-->
                        <div class="seccion-superior" id="seccion-superior">
                            <div class="container">
                                <div class="row">
                                    
                                        
                                            <button class="submit-btn">
                                                <span>Iniciar sesion</span>
                                            </button>
                                             <button class="submit-btn">
                                                <span>Registrarse</span>
                                            </button>
                                         
                                    
                                </div>
                            </div>
                        </div>
                        <!--final area-->
                        <nav class="menu" id="menu">
                            <ul id="mainMenu">
                                <li data-menuanchor="home" class="active"><a href="#home"><i class="fa fa-home"></i> Home</a></li>
                                <li data-menuanchor="seccion2"><a href="#seccion2"><i class="fa fa-user"></i> Planilla</a></li>
                                <li data-menuanchor="seccion3"><a href="#seccion3">Empleados</a></li>
                                 <li data-menuanchor="seccion4"><a href="#seccion4">Ventas</a></li>
                                <li data-menuanchor="seccion5"><a href="#seccion5">Entradas</a></li>
                                 <li data-menuanchor="seccion6"><a href="#seccion6">Inventario</a></li>
                                <li data-menuanchor="seccion7"><a href="#seccion7">Salidas</a></li>
                                <li data-menuanchor="seccion8"><a href="#seccion8">Adelantos</a></li>
                                <li data-menuanchor="contact"><a href="#contact">Informacion</a></li>
                            </ul>
                        </nav>
                       


                    </div>
                </div>
            </div>
        </header>
        <!--final Header-->


        <!--inicio seccion 1-->
        <section class="seccion1-area home animated-text section pp-scrollable" id="seccion1-area">
                <div class="image-bg" id="seccion1-image-area">
                    <div class="content-container">
                        <div class="overlayImg"></div>
                        <div class="title-small"><p>inicio</p></div>
                        <div class="display-table">
                            <div class="display-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="seccion1-text">
                                                <div class="type-wrap">
                                                    <div id="typed-strings">
                                                        <h1>* <span>Auto Servicios "El Boulevard"</span> *</h1>
                                                        <h1>* <span>Tienda de Comestibles</span> *</h1>
                                                        <h1>* <span>Tecniwash Car-Service System</span> *</h1>
                                                    </div>
                                                    <span id="typed"></span>
                                                </div>
                                                <p ALIGN =justify>
                                                    Auto Servicios "El Boulevard" es una empresa dedicada al mantenimiento de su vehículo
                                                    las 24 horas, ademas le ofrecemos productos a la venta de la mejor calidad para tu auto,
                                                    todo lo que necesites aquí lo encuentras.
                                                </p>
                                                <div class="social-icons">
                                                    <a href="https://www.facebook.com/Auto-servicios-el-boulevard-llantera-24-horas-142372532602178/?ref=page_internal"><i class="fab fa-facebook-f" aria-hidden="true"></i></a>
                                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                                    <a href="#"><i class="fab fa-google"></i></a>
                                                    <a href="#"><i class="fab fa-skype"></i></a>
                                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <!--final seccion 1-->


        <!--inicio seccion 2-->
        <section class="seccion2 section pp-scrollable" id="seccion2">
            <div class="content-container">
                <div class="display-table">
                    <div class="display-content">
                        <div class="seccion2-header">
                            <div class="title-small"><p>Inventario</p></div>
                            <h4 class="section-title">Inventario</h4> 
                        </div>
                        <div class="seccion2-content">
                        <!-- inicio del contenido -->
                        <div class="container">
                           
                            <div class="row s2 align-items-start">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-5">
                                            <div class="form-group pull-right">
                                    
                                                  
                                            <?php
                                               include ('busqueda.php');
                                             ?>
                                          
                                             <br>
                                         
                                        


                                    </div>
                                        </div>
                                        <div class="col-2">
                                            <span class="counter pull-right"></span>
                                        </div>
                                    </div>


                                    <table class="table table-striped">
                                      <thead>
                                        <tr>
                                          <th>Cod</th>
                                          <th>Nombre</th>
                                          <th>Descripción</th>
                                          <th>Marca</th>
                                          <th>Proveedor</th>
                                          <th>Cantidad</th>
                                        </tr>
                                        <tr class="warning no-result">
                                            <td colspan="4"><i class="fa fa-warning"></i> No se encontraron coincidencias</td>
                                          </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <th scope="row">1</th>
                                          <td>cold</td>
                                          <td>cole</td>
                                          <td>ksjs</td>
                                          <td>ksjs</td>
                                          <td>ksjs</td>
                                        </tr>
                                        <tr>
                                          <th scope="row">2</th>
                                          <td>colg</td>
                                          <td>colh</td>
                                          <td>rssf</td>
                                          <td>ksjs</td>
                                          <td>ksjs</td>
                                        </tr>
                                        <tr>
                                          <th scope="row">3</th>
                                          <td>colj</td>
                                          <td>colk</td>
                                          <td>fsfsfxf</td>
                                          <td>ksjs</td>
                                          <td>ksjs</td>
                                        </tr>
                                        <tr>
                                          <th scope="row">4</th>
                                          <td>col1</td>
                                          <td>col2</td>
                                          <td>sytfxf</td>
                                        </tr>
                                      </tbody>
                                    </table>


                                </div>
                            </div>
                        </div>
                        <!-- fin del contenido -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--final seccion 2-->


        <!--inicio seccion 3-->
        <section class="seccion3 section pp-scrollable" id="seccion3">
            <div class="content-container">
                <div class="display-table">
                    <div class="display-content">
                        <div class="seccion3-header">
                            <div class="title-small"><p>Empleados</p></div> 
                            <h4 class="section-title">Empleados</h4> 
                        </div>
                        <div class="seccion3-content">
                            <!-- inicio del contenido -->
                            <div class="container s3">
                                <div class="row">
                                    <!-- inicio tarjeta empleado -->
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <div class="seccion3-item">
                                            <span><i class="fas fa-user"></i></span>
                                            <p class="content-title">nombre empleado</p>
                                            <div class="content-text">
                                                <table class="table table-striped table-sm table-borderless">
                                                    <tr>
                                                        <td>Identidad:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Direccion:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Telefono:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Correo:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- final tarjeta empleado -->
                                    <!-- inicio tarjeta empleado -->
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <div class="seccion3-item">
                                            <span><i class="fas fa-user"></i></span>
                                            <p class="content-title">nombre empleado</p>
                                            <div class="content-text">
                                                <table class="table table-striped table-sm table-borderless">
                                                    <tr>
                                                        <td style="text-align: right;">Identidad:</td>
                                                        <td style="text-align: left;">1408188105784</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">Direccion:</td>
                                                        <td style="text-align: left;">Res. plaza B8 C16</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">Telefono:</td>
                                                        <td style="text-align: left;">97249790</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">Correo:</td>
                                                        <td style="text-align: left;">empleado@gmail.com</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- final tarjeta empleado -->
                                    <!-- inicio tarjeta empleado -->
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <div class="seccion3-item">
                                            <span><i class="fas fa-user"></i></span>
                                            <p class="content-title">nombre empleado</p>
                                            <div class="content-text">
                                                <table class="table table-striped table-sm table-borderless">
                                                    <tr>
                                                        <td>Identidad:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Direccion:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Telefono:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Correo:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- final tarjeta empleado -->
                                    <!-- inicio tarjeta empleado -->
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <div class="seccion3-item">
                                            <span><i class="fas fa-user"></i></span>
                                            <p class="content-title">nombre empleado</p>
                                            <div class="content-text">
                                                <table class="table table-striped table-sm table-borderless">
                                                    <tr>
                                                        <td>Identidad:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Direccion:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Telefono:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Correo:</td>
                                                        <td>info empleado</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- final tarjeta empleado -->
                                </div>
                            </div>
                           <!-- final del contenido -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--final seccion 3-->


        <!--inicio seccion 4-->
        <section class="seccion4 section pp-scrollable" id="seccion4">
            <div class="content-container">
                <div class="display-table">
                    <div class="display-content">
                         <div class="seccion4-header">
                            <div class="title-small"><p>seccion 4</p></div>
                            <h4 class="section-title">seccion 4</h4>
                        </div>
                        <div class="seccion4-content">
                            <!-- inicio del contenido -->
                            <div class="container">
                                


                            </div>
                            <!-- final del contenido -->
                        </div> 
                    </div>
                </div>
            </div>
        </section>
        <!--final seccion 4-->


        <!--inicio seccion 5-->
        <section class="seccion5 section pp-scrollable" id="seccion5">
            <div class="content-container">
                <div class="display-table">
                    <div class="display-content">
                        <div class="seccion5-header">
                            <div class="title-small"><p>seccion 5</p></div>
                            <h4 class="section-title">seccion 5</h4>
                        </div>
                        <div class="seccion5-content">
                            <!-- inicio del contenido -->
                            <div class="container">



                               
                            </div>
                            <!-- final del contenido -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--final seccion 5-->

        <!--inicio seccion 6-->
        <section class="seccion6 section pp-scrollable" id="seccion6">
            <div class="content-container">
                <div class="display-table">
                    <div class="display-content">
                        <div class="seccion6-header">
                            <div class="title-small"><p>seccion 6</p></div>
                            <h4 class="section-title">seccion 6</h4>
                        </div>
                        <div class="seccion6-content">
                            <!-- inicio del contenido -->
                            <div class="container">
                                


                            </div>
                            <!-- final del contenido -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--final seccion 6-->

        <!--inicio seccion 7-->
        <section class="seccion7 pp-scrollable section" id="seccion7">
            <div class="content-container">
                <div class="display-table">
                    <div class="display-content">
                        <div class="seccion7-header">
                            <div class="title-small"><p>seccion 7</p></div>
                            <h4 class="section-title">seccion 7</h4>
                        </div>
                        <div class="client-area">
                            <!-- inicio del contenido -->
                            <div class="container">


                                
                            </div>
                            <!-- final del contenido -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--final seccion 7-->


        <!--inicio seccion 8-->
        <section class="seccion8 pp-scrollable section" id="seccion8">
            <div class="content-container">
                <div class="display-table">
                    <div class="display-content">
                        <div class="seccion8-header">
                            <div class="title-small"><p>seccion 8</p></div>
                            <h4 class="section-title">seccion 8</h4>
                        </div>
                        <div class="seccion8-content">
                            <!-- incio del contenido -->
                            <div class="container">
                                



                            </div>
                            <!-- final del contenido -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--final seccion 8-->


        <!--inicio seccion de contacto-->
        <section class="contact footer pp-scrollable section" id="contact">
            <div class="content-container">
                <div class="display-table">
                    <div class="display-content">
                        <div class="contact-header">
                            <div class="title-small"><p>Contactanos</p></div>
                            <h4 class="section-title">INFORMACIÓN</h4>
                        </div>
                        <div class="contact-content ">
                            <div class="container ">
                                <div class="row ">
                                    <div class="col-lg-6 col-md-12 col-sm-12 s9">
                                        <div class="contact-detail">
                                            <h6>Contacto</h6>
                                            <p class="contact-text">Auto Servicios "El Boulevard"</p>
                                            <p class="adress">
                                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                <span>Direccion:</span>
                                                <span class="adress-loc">direccion del establecimiento</span>
                                            </p>
                                            <p class="phone">
                                                <i class="fa fa-phone" aria-hidden="true"></i>
                                                <span>Telefono:</span>3307-8867
                                            </p>
                                            <p class="email">
                                                <i class="fas fa-envelope" aria-hidden="true"></i>
                                                <span>Email:</span>tecniwash@gmail.com
                                            </p>
                                            <p>
                                                <i class="fa fa-globe" aria-hidden="true"></i>
                                                <span>Website:</span><a href="#">www.tecniwasweb.com</a>
                                            </p>
                                            <div class="social-icons">
                                                <p>Encuentranos:</p>
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-google"></i></a>
                                                <a href="#"><i class="fab fa-skype"></i></a>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12">
                                    <!--     <div class="contact-form">
                                            <form class="contact-form-area" action="https://latahsin.github.io/rivo/contact.php" method="post">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" name="name" placeholder="Name" id="form-name">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" name="email" placeholder="Email" id="form-email">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <input type="text" name="subject" placeholder="Subject" id="form-subject">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <textarea placeholder="Type here" name="message" id="form-message"></textarea>
                                                        <input type="submit" class="submit-btn btn-style1 clearfix" value="Submit" id="contact-submit">
                                                        <div class="result"></div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                        <!--inicio Footer-->
                        <footer>
                            <div class="container">
                              <!--   <div class="row">
                                    <div class="col-md-12">
                                        <div class="copyright">
                                            <p>Copyright © 2020 TecniWash | Todos los derechos reservados</p>
                                        </div>
                                    </div>
                                </div> -->
                            </div>
                        </footer>
                        <!--final footer-->
                    </div>
                </div>
            </div>
        </section>
        <!--final seccion de coontacto-->


    </div>
    <!--javascript-->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/typed.min.js"></script>
    <script src="js/animatedModal.js"></script>
    <script src="js/jquery.pagepiling.min.js"></script>
    <script src="js/jquery.singlePageNav.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/tabla.js"></script>
</body>