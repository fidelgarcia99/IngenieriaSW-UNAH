<div class="modal fade" id="nuevoClienteRtnModal" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
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
                                             <h5 class="card-title text-center" id="modal-titulo">Clientes Registrados</h5>
                                             <form class="form-signin">
                                                  <div class="form-label-group">
                                                       

                                                       
                                                       

                                                  </div>


                                                 

                                                

                                                  <h6>Cliente-RTN</h6>
                                                  <div class="form-label-group">
                                                       <select class="form-control" name="nom_cliente" id="nom_cliente" >

                                                            <?php Cliente::llenarCliente($conexion); ?>

                                                       </select>
                                                       
                                                       
                                                  </div>


                                                 <!--   <h6>Id/RTN</h6>
                                                  <div class="form-label-group">
                                                       <input type="text" id="inputId" class="form-control" placeholder="Id/RTN" >
                                                      
                                                  </div>  -->
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
                    <button type="button" class="btn btn-primary" onclick="registrarCliente();">Aceptar</button>
               </div>
          </div>
     </div>
</div>
<?php include(SECCIONES.'success-modal.php')?>
