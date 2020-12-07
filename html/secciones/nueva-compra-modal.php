<div class="modal fade" id="nueva-compra-modal" tabindex="-1" role="dialog" aria-hidden="true">
     <div class="modal-dialog" role="document">
          <div class="modal-content">

               <div class="modal-body p-0">
                    <div class="container px-0">
                         <div class="row">
                              <div class="col">
                                   <div class="card card-signin flex-row">
                                        <div class="card-body">
                                             <h5 class="card-title text-center" id="modal-titulo">Registrar Compra</h5>
                                             <div class="input-group">
                                                  <input type="number" id="numFactura" class="form-control" placeholder="Número de Factura" required autofocus>
                                             </div>
                                             <br>
                                             <h6>Proveedor</h6>
                                             <div class="form-label-group">
                                                  <select class="form-control" id="nom_proveedor">
                                                       <?php Producto::llenarProveedor($conexion); ?>
                                                  </select>
                                             </div>
                                             <br>
                                             <h6>Fecha de Factura</h6>
                                             <div class="input-group">
                                             <input type="date" id="numFactura" class="form-control" placeholder="Número de Factura" required autofocus>
                                             </div>
                                             <br>
                                             <div class="input-group">
                                                  <input type="number" id="ISV" class="form-control" placeholder="ISV" required autofocus>
                                             </div>
                                             <br>
                                             <div class="input-group">
                                                  <input type="number" id="total" class="form-control" placeholder="Total" required autofocus>
                                             </div>

                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>
               <div class="modal-footer py-0">
                    <button type="button" class="btn btn-secondary" onclick="" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="">Aceptar</button>
               </div>
          </div>
     </div>
</div>
<?php include(SECCIONES . 'success-modal.php') ?>