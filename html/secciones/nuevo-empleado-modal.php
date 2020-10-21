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
                                             <h5 class="card-title text-center">Nuevo Empleado</h5>
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
                                                       <input type="text" pattern="[0-9]+" maxlength="13" minlength="13" id="inputNumid" class="form-control" placeholder="Número Id" required>
                                                  </div>
                                                  <div class="form-label-group">
                                                       <input type="number" id="inputNumtel" class="form-control" placeholder="Número Telefonico" required>
                                                  </div>

                                                  <div class="form-label-group">
                                                       <input type="text" id="inputDireccion" class="form-control" placeholder="Dirección" required>
                                                  </div>

                                                  <h6>Cargo</h6>
                                                  <div class="form-label-group">
                                                       <select class="form-control" id="selectIdEmpleado" >
                                                            <option disabled>Seleccion un cargo</option>
                                                            

                                                       </select>
                                                  </div>


                                                  <h6>Fecha de contratación</h6>
                                                  <div class="form-label-group">
                                                       <input type="date" id="inputFecha" class="form-control" placeholder="Fecha" required>
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