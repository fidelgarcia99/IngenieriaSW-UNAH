<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

<!-- Sidebar - Brand -->
<a class="sidebar-brand d-flex align-items-center justify-content-center" href="?view=index">
  <div class="sidebar-brand-icon rotate-n-15">
  <i class="fas fa-car"></i>
  </div>
  <div class="sidebar-brand-text mx-3">El Boulevard</div>
</a>

<!-- Divider -->
<hr class="sidebar-divider my-0">

<!-- Nav Item - Dashboard -->
<li class="nav-item">
  <a class="nav-link" href="?view=index">
    <i class="fas fa-fw fa-tachometer-alt"></i>
    <span>Inicio</span></a>
</li>

<!-- Divider -->
<hr class="sidebar-divider">

<?php
  if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
    echo '
    <!-- Nav Item - Inventario -->
    <li class="nav-item">
      <a class="nav-link" href="?view=inventario">
        <i class="fas fa-fw fa-boxes"></i>
        <span>Inventario</span></a>
    </li>
    ';
  }

  if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
    echo '
    <!-- Nav Item - Tables -->
    <li class="nav-item">
      <a class="nav-link" href="?view=compras">
        <i class="fas fa-shopping-cart"></i>
        <span>Compras</span></a>
    </li>
    ';
  }

  if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
    echo '
    <!-- Nav Item - Planilla -->
    <li class="nav-item">
      <a class="nav-link" href="?view=planilla">
        <i class="fas fa-fw fa-money-bill-alt"></i>
        <span>Planilla</span></a>
    </li>
    ';
  }

  if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
    echo '
    <!-- Nav Item - Tables -->
    <li class="nav-item">
      <a class="nav-link" href="?view=empleados">
        <i class="fas fa-users"></i>
        <span>Empleados</span></a>
    </li>
    ';
  }

  if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
    echo '
    <!-- Nav Item - Clientes -->
    <li class="nav-item">
      <a class="nav-link" href="?view=clientes">
        <i class="fas fa-address-card"></i>
        <span>Clientes</span></a>
    </li>
    ';
}
    if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
      echo '
      <!-- Nav Item - Usuarios -->
      <li class="nav-item">
        <a class="nav-link" href="?view=usuarios">
          <i class="fas fa-user-edit"></i>
          <span>Usuarios</span></a>
      </li>
      ';
    }

      if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="supervisor" || JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
        echo '
        <!-- Nav Item - Tables -->
        <li class="nav-item">
          <a class="nav-link" href="?view=proveedores">
            <i class="fas fa-users"></i>
            <span>Proveedores</span></a>
        </li>
        ';
      }

        if ((JWTokens::GetData($_COOKIE['token'])['tipo']=="admin")) {
          echo '
          <!-- Nav Item - Tables -->
          <li class="nav-item">
            <a class="nav-link" href="?view=facturacion">
              <i class="fas fa-receipt"></i>
              <span>Nueva Factura</span></a>
          </li>
          ';
  }
?>
<!-- Divider -->
<hr class="sidebar-divider d-none d-md-block">

<!-- Sidebar Toggler (Sidebar) -->
<div class="text-center d-none d-md-inline">
  <button class="rounded-circle border-0" id="sidebarToggle"></button>
</div>

</ul>
