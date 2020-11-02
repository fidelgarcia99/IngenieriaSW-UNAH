<div class="modal fade" id="nuevoClienteModal" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
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
                                             <h5 class="card-title text-center">Nuevo Cliente</h5>
                                             <form class="form-signin">
                                                  <div class="form-label-group">
                                                       <div class="input-group">
                                                            <input type="text" id="pNombreCliente" class="form-control" placeholder="Primer Nombre" required autofocus>
                                                            <br>
                                                            <input type="text" id="sNombreCliente" class="form-control" placeholder="Segundo Nombre">
                                                       </div>

                                                       <br>
                                                       <div class="input-group">
                                                            <input type="text" id="pApellidoCliente" class="form-control" placeholder="Primer Apellido" required autofocus>
                                                            <br>
                                                            <input type="text" id="sApellidoCliente" class="form-control" placeholder="Segundo Apellido">
                                                       </div>

                                                  </div>


                                                  <div class="form-label-group">

                                                       <input type="number"  id="numTelCliente" class="form-control" placeholder="Número Telefonico" >
                                                  </div>

                                                  <div class="form-label-group">
                                                       <input type="email" id="inputEmail" class="form-control" placeholder="Email" >
                                                  </div>
<h6>Ciudad</h6>
                                                  <div class="form-label-group">
                                                       <select class="form-control" id="nom_ciudad" >

                                                            <?php Cliente::llenarCiudad($conexion); ?>

                                                       </select>
                                                  </div>

                                                  <div class="form-label-group">
                                                       <input type="text" id="direccion" class="form-control" placeholder="Dirección" >
                                                  </div>


                                                  <h6>Id/RTN</h6>
                                                  <div class="form-label-group">
                                                       <input type="text" id="inputId" class="form-control" placeholder="Id/RTN" required>
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
                    <button type="button" class="btn btn-primary" onclick="registrarCliente();">Guardar</button>
               </div>
          </div>
     </div>
</div>
<?php include(SECCIONES.'success-modal.php')?>
