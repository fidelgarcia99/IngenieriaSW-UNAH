<?php
  switch ($_GET['view']) {
    case 'empleados':
     echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoEmpleadoModal"><i class="fas fa-user-plus"></i></button>' ;
    break;
    case 'usuarios':
      echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoUsuarioModal"><i class="fas fa-user-plus"></i></button>';

    break;
    case 'clientes':
      echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoClienteModal"><i class="fas fa-user-plus"></i></button>';

    break;
    case 'proveedores':
      echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoProveedorModal"><i class="fas fa-user-plus"></i></button>';

    break;
    case 'inventario':
    echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoProductoModal"><i class="fas fa-user-plus"></i></button>';
    break;
    case 'compras':
    echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoProductoModal"><i class="fas fa-user-plus"></i></button>';
    break;
  }

?>
