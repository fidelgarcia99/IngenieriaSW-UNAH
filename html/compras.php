<?php include(SECCIONES . 'valida-acceso.php');
if (!(JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
  header('Location: ?view=401');
 
}
include("php/clases/class_conexion.php");
include_once("php/clases/class_producto.php");
include_once("php/clases/class_compra.php");
$conexion = new Conexion()
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <?php include(SECCIONES . 'head-general.php')?>

  <!-- Custom styles for this page -->
  <link href="<?php echo VENDOR?>datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link href="<?php echo CSS ?>modales.style.css" rel="stylesheet">
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

        <!-- Begin Page Content -->
        <?php include(SECCIONES . 'tabla.php')?>
        <!-- /.container-fluid -->

        <?php include(SECCIONES . 'detalle-compra-modal.php')?>
        
        <?php include(SECCIONES . 'nueva-compra-modal.php')?>

        <?php include(SECCIONES . 'nueva-compradetalle-modal.php')?>


      </div>
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

      <!-- Page level plugins -->
  <script src="<?php echo VENDOR?>datatables/jquery.dataTables.min.js"></script>
  <script src="<?php echo VENDOR?>datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="<?php echo JS ?>product-format.js"></script>
  <script src="<?php echo JS?>axios-calls.js"></script>
  <script src="<?php echo JS?>compras-controller.js"></script>
</body>

</html>
