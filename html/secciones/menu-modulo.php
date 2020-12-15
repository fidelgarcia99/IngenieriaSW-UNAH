<?php
  switch ($_GET['view']) {
    case 'empleados':
    if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoEmpleadoModal"><i class="fas fa-user-plus"></i></button>' ;
      echo '<button type="button" class="btn btn-warning mx-1" onclick="editarRegistro()" disabled id="btnEdit"><i class="fas fa-user-edit"></i></button>';
      echo '<button type="button" class="btn btn-danger mx-1" onclick="despedirEmpleado()" disabled id="btnDelete"><i class="fas fa-user-times"></i></button>';
    }
    break;
    case 'usuarios':
    if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '<button type="button" class="btn btn-primary mx-1" data-toggle="modal" data-target="#nuevoUsuarioModal" id="btnNuevo"><i class="fas fa-user-plus"></i></button>';
      echo '<button type="button" class="btn btn-warning mx-1" onclick="editarRegistro()" disabled id="btnEdit"><i class="fas fa-user-edit"></i></button>';
      echo '<button type="button" class="btn btn-danger mx-1" onclick="eliminarRegistro()" disabled id="btnDelete"><i class="fas fa-user-minus"></i></button>';
    }
    break;
    case 'clientes':
    if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoClienteModal"><i class="fas fa-user-plus"></i></button>';
      echo '<button type="button" class="btn btn-warning mx-1" onclick="editarRegistro()" disabled id="btnEdit"><i class="fas fa-user-edit"></i></button>';
      echo '<button type="button" class="btn btn-danger mx-1" onclick="eliminarRegistro()" disabled id="btnDelete"><i class="fas fa-user-minus"></i></button>';
    }

    break;
    case 'proveedores':
    if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoProveedorModal"><i class="fas fa-user-plus"></i></button>';
      echo '<button type="button" class="btn btn-warning mx-1" onclick="editarRegistro()" disabled id="btnEdit"><i class="fas fa-user-edit"></i></button>';
      echo '<button type="button" class="btn btn-danger mx-1" onclick="eliminarRegistro()" disabled id="btnDelete"><i class="fas fa-user-minus"></i></button>';
    }

    break;
    case 'inventario':
    if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoProductoModal"><i class="fas fa-plus-square"></i></button>';
      echo '<button type="button" class="btn btn-warning mx-1" onclick="editarRegistro()" disabled id="btnEdit"><i class="fas fa-edit"></i></button>';
      echo '<button type="button" class="btn btn-danger mx-1" onclick="eliminarRegistro()" disabled id="btnDelete"><i class="fas fa-trash-alt"></i></button>';
    }

    break;
    case 'compras':
    if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '<a href="?view=nueva-compra" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>';
    }
    break;
  }

?>
