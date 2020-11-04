<div class="modal fade" id="nuevoUsuarioModal" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-body p-0">
        <div class="container px-0">
           <div class="row">
             <div class="col">
               <div class="card card-signin flex-row">
                 <div class="card-img-left d-none d-md-flex">
                    <!-- Background image for card set in CSS! -->
                 </div>
                 <div class="card-body">
                   <h5 class="card-title text-center">Nuevo Usuario</h5>
                   <form class="form-signin">
                     <div class="form-label-group">
                       <input type="text" id="inputUserame" class="form-control" placeholder="Username" onfocusin="teclea(this);" onfocusout="isCampoVacio(this);" onkeyup="isCamposLlenos2();" required autofocus>
                     </div>

                     <div class="form-label-group">
                       <select class="form-control" onchange="isCampoVacio(this);" id="selectIdEmpleado">

                       </select>
                     </div>
                     <div class="form-label-group">
                       <select class="form-control" onchange="isCampoVacio(this);" id="selectTipoUsuario">

                       </select>
                     </div>

                     <hr>

                     <div class="form-label-group">
                       <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" onfocusin="teclea(this);" onfocusout="isCampoVacio(this);" onkeyup="isCamposLlenos2();"required>
                     </div>

                     <div class="form-label-group">
                       <input type="password" id="inputConfirmPassword" class="form-control" placeholder="Confirmar Contraseña" onfocusin="teclea(this);" onfocusout="isCampoVacio(this);" onkeyup="comparaContraseñas();" required>
                     </div>
                     <div id="errorMessage" class="alert alert-danger" style="display:none">
                       Credenciales Incorrectas
                     </div>
                     <div id="errorContras" class="alert alert-danger" style="display:none">
                       Las contraseñas no coinciden.
                     </div>
                   </form>
                 </div>
               </div>
             </div>
           </div>
         </div>
      </div>
      <div class="modal-footer py-0">
        <button type="button" class="btn btn-secondary" onclick="limpiarModal();" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="registraUsuario();" id="btnRegistra">Guardar</button>
      </div>
    </div>
  </div>
</div>
<?php include(SECCIONES. 'success-modal.php');?>
