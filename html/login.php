<?php
      session_start();
      if(isset($_SESSION['token'])){
        if(isset($_COOKIE['token'])){
          if($_COOKIE['token'] == $_SESSION['token']){
            header('Location: ?view=index');
          }
        }
      }


?>
<!DOCTYPE html>
<html lang="en">

<head>

<?php include SECCIONES.'head-general.php'?>

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">

             <!--  <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>-->
             <img src="<?php echo IMG?>logoicon.jpg" alt="" class="col-lg-6 d-none d-lg-block bg-login-image">
              <div class="col-lg-6">
                <div class="p-5">
                <br>
              <br>
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">"Bienvenido al Sistema de Auto Servicio "El Boulevard"!</h1>
                  </div>
                  <form class="user">
                    <div class="form-group">
                      <input type="id" class="form-control form-control-user" id="inputID" aria-describedby="idHelp" placeholder="Ingrese Id" onfocusin="teclea(this);" onfocusout="isCampoVacio(this);">
                      <div class="invalid-feedback" style="display:none">
                        Ingrese su identidad.
                      </div>
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="inputPasswd" placeholder="Password" onfocusin="teclea(this);" onfocusout="isCampoVacio(this);">
                      <div class="invalid-feedback" style="display:none">
                        Ingrese su constraseña.
                      </div>
                    </div>
                    <div id="errorMessage" class="alert alert-danger" style="display:none">
                    Credenciales Incorrectas
                    </div>
                    <hr>
                    <button onclick="validaLogin();" class="btn btn-primary btn-user btn-block" type="button">Iniciar Sesion</button>
                    <hr>

                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <?php include SECCIONES.'scripts-generales.php'?>
  <script src="<?php echo JS?>login-controller.js"></script>

</body>

</html>
