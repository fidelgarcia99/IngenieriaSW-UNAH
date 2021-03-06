<?php
include(SECCIONES . 'valida-acceso.php') ;

//El empleado es cajero o admin?
if (!(JWTokens::GetData($_COOKIE['token'])['tipo']=="cajero" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
  header('Location: ?view=401');
}
//

include("php/clases/class_conexion.php");
//se incluye la clase empleados parapoder llamar sus funciones desde el index
include_once("php/clases/class_producto.php");
//objeto Conexion
$conexion = new Conexion();?>

<!DOCTYPE html>
<html lang="en">

<head>
  <?php include(SECCIONES . 'head-general.php')?>
   <!-- Custom styles for this page -->
   <link href="<?php echo VENDOR ?>datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link href="<?php echo CSS ?>modales.style.css" rel="stylesheet">
  <link href="<?php echo CSS ?>modales.style.css" rel="stylesheet">
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <?php
    if (JWTokens::GetData($_COOKIE['token'])['tipo']=="admin") {
      include(SECCIONES . 'sidebar.php');
    }
    ?>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
    <?php include(SECCIONES . 'topnav.php')?>
        <!-- End of Topbar -->

        <!-------------------------- Begin Page Content ------------------------------>

      <?php include(SECCIONES . 'facturaciondetalles.php')?>

      </div>
      <?php include(SECCIONES . 'modal-cliente-rtn.php') ?>
      <?php include(SECCIONES . 'modal-consulta-precio.php') ?>
      <!-- End of Main Content -->

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

  <!-- Page level custom scripts -->
  <script src="<?php echo JS?>product-format.js"></script>
  <script src="<?php echo JS?>axios-calls.js"></script>
  <script src="<?php echo JS?>shortcuts.js"></script>
  <script src="<?php echo JS?>facturacion-controller.js"></script>

</body>

</html>
