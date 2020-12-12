<div class="modal fade" id="nuevoEmpleadoModal" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
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
                                             <h5 class="card-title text-center" id="modal-titulo">Nuevo Empleado</h5>
                                             <form class="form-signin">
                                                  <div class="form-label-group">
                                                       <div class="input-group">
                                                            <input type="text" id="inputPnombre"  class="form-control" placeholder="Primer Nombre" required autofocus>
                                                            <br>
                                                            <input type="text" id="inputSnombre" class="form-control" placeholder="Segundo Nombre">
                                                       </div>

                                                       <br>
                                                       <div class="input-group">
                                                            <input type="text" id="inputPapellido" class="form-control" placeholder="Primer Apellido" required autofocus>
                                                            <br>
                                                            <input type="text" id="inputSapellido" class="form-control" placeholder="Segundo Apellido">
                                                       </div>

                                                  </div>


                                                  <div class="form-label-group">
                                                       <input type="number" pattern="[0-9]+"  id="inputNumid" class="form-control" placeholder="Número Id" required>
                                                  </div>
                                                  <div class="form-label-group">
                                                       <input type="number" pattern="[0-9]+"  id="inputNumtel" class="form-control" placeholder="Número Telefonico" required>
                                                  </div>

                                                  <h6>Ciudad</h6>
                                                  <div class="form-label-group">
                                                       <select class="form-control" id="nom_ciudad" >

                                                            <?php Empleado::llenarCiudad($conexion); ?>

                                                       </select>
                                                  </div>

                                                  <div class="form-label-group">
                                                       <input type="text" id="inputDireccion" class="form-control" placeholder="Dirección" required>
                                                  </div>

                                                  <h6>Cargo</h6>
                                                  <div class="form-label-group">
                                                       <select class="form-control" id="selectCargo" >

                                                            <?php Empleado::llenarCargos($conexion); ?>

                                                       </select>
                                                  </div>


                                                  <h6>Correo Electronico</h6>
                                                  <div class="form-label-group">
                                                       <input type="text" id="inputEmail" class="form-control" placeholder="Email" required>
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
                    <button type="button" class="btn btn-secondary" onclick="limpiarModal();" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" onclick="registraEmpleado();">Registrar</button>
               </div>
          </div>
     </div>
</div>
<?php include(SECCIONES. 'success-modal.php');?>
