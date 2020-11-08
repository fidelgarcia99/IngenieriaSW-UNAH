<?php include(SECCIONES . 'valida-acceso.php') ;
include("php/clases/class_conexion.php");
//se incluye la clase empleados parapoder llamar sus funciones desde el index
include_once("php/clases/class_empleado.php");
//objeto Conexion
$conexion = new Conexion();?>

<!DOCTYPE html>
<html lang="en">

<head>
  <?php include(SECCIONES . 'head-general.php')?>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <?php include(SECCIONES . 'sidebar.php')?>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
    <?php include(SECCIONES . 'topnav.php')?>
        <!-- End of Topbar -->

        <!-------------------------- Begin Page Content ------------------------------>
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">Facturación</h1>

        </div>
        <!--------------------------- /.container-fluid -------------------------------->

      </div>
      <!-- End of Main Content -->
      <?php include(SECCIONES . 'facturaciondetalles.php')?>
      <!-- Footer -->
      <?php include(SECCIONES . 'footer.php')?>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <?php include(SECCIONES . 'logout-modal.php')?>

  <!-- Scripts-->
  <?php include(SECCIONES . 'scripts-generales.php')?>
  <!------------>
</body>

</html>
