<div class="modal fade" id="nueva-compradetalle-modal" tabindex="-1" role="dialog" aria-hidden="true">
     <div class="modal-dialog" role="document">
          <div class="modal-content">

               <div class="modal-body p-0">
                    <div class="container px-0">
                         <div class="row">
                              <div class="col">
                                   <div class="card card-signin flex-row">
                                        <div class="card-body">
                                             <h5 class="card-title text-center" id="modal-titulo">Registrar Detalles de Compra</h5>
                                            
                                             <h6>Facturas</h6>
                                             <div class="form-label-group">
                                                  <select class="form-control" id="numFacturaDetalle">
                                                       <?php Compra::llenarFacturaCompra($conexion); ?>
                                                  </select>
                                             </div>
                                             <br>
                                             <h6>Producto</h6>
                                             <div class="form-label-group">
                                                  <select class="form-control" id="productoDetalle">
                                                       <?php Compra::llenarProducto($conexion); ?>
                                                  </select>
                                             </div>
                                             <br>
                                             <div class="input-group">
                                                  <input type="number" id="cantidadDetalle" class="form-control" placeholder="Cantidad" required autofocus>
                                             </div>
                                             <br>
                                             <div class="input-group">
                                             <input type="number" id="precioDetalle" class="form-control" placeholder="Precio" required autofocus>
                                             </div>
                                             <br>
                                             <div class="input-group">
                                                  <input type="number" id="ISVDetalle" class="form-control" placeholder="ISV" required autofocus>
                                             </div>
                                             <br>
                                             <div class="input-group">
                                                  <input type="number" id="descuentoDetalle" class="form-control" placeholder="Descuento" required autofocus>
                                             </div>
                                             <br>
                                             <div class="input-group">
                                                  <input type="number" id="totalDetalle" class="form-control" placeholder="Total" required autofocus>
                                             </div>

                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>
               <div class="modal-footer py-0">
                    <button type="button" class="btn btn-secondary" onclick="limpiarModal();" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="registrarCompraDetalle()">Aceptar</button>
               </div>
          </div>
     </div>
</div>
<?php include(SECCIONES . 'success-modal.php') ?>