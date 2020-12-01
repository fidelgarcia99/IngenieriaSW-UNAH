<div class="container-fluid px-0">
<!-- DataTales Example -->
<div class="card shadow mb-4">

<div class="card-body">
  <div class="table-responsive">
    <!-- Inicio Filtro y Busqueda -->
    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
      <div class="row">
        <div class="col-3 mb-3">
          <?php if($_GET['view']=="empleados") echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoEmpleadoModal"><i class="fas fa-user-plus"></i></button>' ?>
          <?php if($_GET['view']=="usuarios") echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoUsuarioModal"><i class="fas fa-user-plus"></i></button>' ?>
          <?php if($_GET['view']=="clientes") echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoClienteModal"><i class="fas fa-user-plus"></i></button>' ?>
          <?php if($_GET['view']=="proveedores") echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoProveedorModal"><i class="fas fa-user-plus"></i></button>' ?>
          <?php if($_GET['view']=="inventario") echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoProductoModal"><i class="fas fa-user-plus"></i></button>' ?>
        </div>
      </div>
    </div>
  <!-- Fin Filtro y Busqueda -->
<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
<thead id="thead">

</thead>
<tbody id="tbody">

</tbody>
</table>
</div>
</div>
</div>

</div>
