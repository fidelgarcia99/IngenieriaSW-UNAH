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
                       <select class="form-control" id="selectIdEmpleado">
                          <option value="1">Empelado 1</option>
                          <option value="2">Empelado 2</option>
                          <option value="3">Empelado 3</option>
                          <option value="4">Empelado 4</option>
                          <option value="5">Empelado 5</option>
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="registraUsuario();" id="btnRegistra">Registrar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <div class="container-fluid">
          <div class="row mx-0 px-0">
            <div class="col-3">
            </div>
            <div class="col-9 mx-0 px-0">
              <i class="fas fa-check-circle mx-auto" id="modal-success-icon"></i>
            </div>
          </div>
          <div class="row mx-0 px-0">
            <div class="col-12 mx-0 px-0">
              <div id="modal-success-message" class="alert alert-success">
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  </div>
</div>
