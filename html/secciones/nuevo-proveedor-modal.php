<div class="modal fade" id="nuevoProveedorModal" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
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
                   <h5 class="card-title text-center">Nuevo Proveedor</h5>
                   <form class="form-signin">
                     <div class="form-label-group">
                       <input type="text" id="inputNombre" class="form-control" placeholder="Nombre" required autofocus>
                     </div>

                     <div class="form-label-group">
                       <input type="text" id="inputDireccion" class="form-control" placeholder="Direccion" required autofocus>
                     </div>

                     <hr>

                     <div class="form-label-group">
                       <input type="password" id="inputTelefono" class="form-control" placeholder="Telefono" required>
                     </div>

                     <div class="form-label-group">
                       <input type="password" id="inputCorreo" class="form-control" placeholder="Correo" required>
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
        <button type="button" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
</div>
