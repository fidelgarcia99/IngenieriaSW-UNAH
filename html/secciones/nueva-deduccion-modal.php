<div class="modal fade" id="nuevaDeduccionModal" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
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
                   <h5 class="card-title text-center">Deduccion</h5>
                   <form class="form-signin">
                     <div class="form-group">
                     <label for="dEmpleados">Empleado:</label>
                       <select id="dEmpleados" class="form-control">
                         <option selected>seleccionar empleado</option>
                         <?php Deduccion::selectEmpleados($conexion);?>
                       </select>
                     </div>

                     <div class="form-group">
                        <label for="dInicio">Inicio:</label>
                       <input type="date" id="dInicio" class="form-control" required>
                     </div>

                     <div class="form-group">
                     <label for="dFinal">Final:</label>
                       <input type="date" id="dFinal" class="form-control" required>
                     </div>

                     <div class="form-group">
                     <label for="dMonto">Monto:</label>
                       <input type="number" id="dMonto" class="form-control" required>
                     </div>

                     <div class="form-group">
                     <label for="dTipo">Tipo:</label>
                       <select id="dTipo" class="form-control">
                        <option selected>seleccionar tipo</option>
                        <?php Deduccion::selectTipos($conexion);?>
                       </select>
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
        <button type="button" class="btn btn-primary" onclick="guardarDeduccion()">Guardar</button>
      </div>
    </div>
  </div>
</div>
<?php include(SECCIONES . 'success-modal.php')?> 