<div class="modal fade" id="nuevoProductoModal" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
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
                                             <h5 class="card-title text-center">Nuevo Producto</h5>
                                             <div class="row">
                                                  <div class="col">
                                                       <button type="button" style="margin-left: 10px" id="ptm" class="btn btn-primary btn-block" data-toggle="modal" data-target="#nuevoAceiteModal"> Aceites <br> <i class="fas fa-oil-can"></i></button>
                                                  </div>

                                                  <div class="col">
                                                       <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#nuevoAceiteModal"> Llantas <br> <i class="fas fa-truck-monster"></i></button>
                                                  </div>
                                             </div>

                                             <br>

                                             <div class="row">
                                                  <div class="col">
                                                       <button type="button" style="margin-left: 10px" class="btn btn-primary btn-block" data-toggle="modal" data-target="#nuevoAceiteModal"> Lubricante <br> <i class="fas fa-tint"></i></i></button>
                                                  </div>

                                                  <div class="col">
                                                       <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#nuevoAceiteModal"> Neumáticos <br> <i class="fas fa-car-side"></i> </button>
                                                  </div>
                                             </div>

                                             <br>

                                             <div class="row">
                                                  <div class="col">
                                                       <button type="button" style="margin-left: 10px" class="btn btn-primary btn-block" data-toggle="modal" data-target="#nuevoAceiteModal"> Comestibles <br> <i class="fas fa-cookie"></i></i></button>
                                                  </div>

                                                  <div class="col">
                                                       <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#nuevoAceiteModal"> Accesorios <br> <i class="fas fa-vr-cardboard"></i></button>
                                                  </div>
                                             </div>

                                             


                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>
               <div class="modal-footer py-0">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" onclick="registraEmpleado();">Registrar</button>
               </div>
          </div>
     </div>
</div>
<?php include(SECCIONES . 'success-modal.php'); ?>