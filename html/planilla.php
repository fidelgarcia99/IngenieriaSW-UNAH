<?php
  include SECCIONES.'valida-acceso.php';
  //incluimos la clase conexion para poder crear el objeto Conexion que enviaremos como parametro
  include_once("php/clases/class_conexion.php");
  //se incluye la clase personas parapoder llamar sus funciones desde el index
  include_once("php/clases/class_planilla.php");
  //objeto Conexion 
  $conexion = new Conexion();
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <?php include(SECCIONES . 'head-general.php')?>

  <link href="<?php echo VENDOR?>datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
          <h1 class="h3 mb-4 text-gray-800">Planilla De Empleados</h1>
        <hr>
        </div>
        <!--------------------------- /.container-fluid -------------------------------->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <?php include(SECCIONES . 'tablaplanilla.php')?>
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
<!-- Page level plugins -->
<script src="<?php echo VENDOR?>datatables/jquery.dataTables.min.js"></script>
<script src="<?php echo VENDOR?>datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="<?php echo JS?>demo/datatables-demo.js"></script>
<script src="js/planilla-controller.js"></script>

</body>

</html>
