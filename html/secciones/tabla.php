<div class="container-fluid px-0 h-100">
  <!-- DataTales Example -->
  <div class="card shadow">
    <div class="card-body">
      <div class="table-responsive">
      <!-- Inicio Filtro y Busqueda -->
      <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
        <div class="row">
        <div id="menu-modulo" class="col-3 mb-3">
        <?php require_once('menu-modulo.php')?>
        </div>
        </div>
      </div>
      <!-- Fin Filtro y Busqueda -->
      <table class="table table-bordered" id="dataTable" width="100%" height="100%" cellspacing="0">
        <thead id="thead"></thead>
        <tbody id="tbody"></tbody>
      </table>
      </div>
    </div>
  </div>
</div>
