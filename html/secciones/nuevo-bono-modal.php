<div class="modal fade" id="nuevoBonoModal" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
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
                   <h5 class="card-title text-center">Bono</h5>
                   <form class="form-signin">
                     <div class="form-group">
                     <label for="bEmpleados">Empleado:</label>
                      <select id="bEmpleados" class="form-control">
                      <option selected>seleccionar empleado</option>
                        <?php Bono::selectEmpleados($conexion);?>
                      </select>
                     </div>
                     <div class="form-group">
                     <label for="bDescripcion">descripcion:</label>
                       <input type="text" id="bDescripcion" class="form-control" placeholder="descripcion" required>
                     </div>
                     <div class="form-group">
                     <label for="bFecha">Fecha:</label>
                       <input type="date" id="bFecha" class="form-control" required>
                     </div>
                     <div class="form-group">
                     <label for="bMonto">Monto:</label>
                       <input type="number" id="bMonto" class="form-control" required>
                     </div>
                     <div id="errorMessage" class="alert alert-danger" style="display:none">
                       Hubo un problema
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
        <button type="button" class="btn btn-primary" onclick="guardarBono()">Guardar</button>
      </div>
    </div>
  </div>
</div>
<?php include(SECCIONES . 'success-modal.php')?> 