<div class="modal fade" id="nuevoConsulta" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
     <div class="modal-dialog" role="document">
          <div class="modal-content">

               <div class="modal-body p-0">
                    <div class="container px-0">
                         <div class="row">
                              <div class="col">
                                   <div class="card card-signin flex-row">
                                        <div class="card-body">
                                             <h5 class="card-title text-center" id="modal-titulo">Consulta de Precios</h5>
                                             <form class="form-signin" method="POST" action="" onSubmit="return validarForm(this)">
                                                  <h6>Producto</h6>
                                                  <div class="row mb-2">
                                                  <div class="col-md-12">
                                                  <select class="form-control" id="select-productos" onchange="cambioPrecio();">
                                                         <?php Producto::llenarProductos($conexion); ?>
                                                      </select>

                                                  </div>

                                                  <br>


                                                  </div>
                                                  <br>

                                                  <h6>Precio Venta</h6>
                                                  <div class="form-label-group">
                                                       <input type="text" id="inputPrecioVenta" class="form-control" placeholder="Precio" readonly>
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
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="escogeCliente();">Aceptar</button>
               </div>
          </div>
     </div>
</div>
<?php include(SECCIONES . 'success-modal.php') ?>
