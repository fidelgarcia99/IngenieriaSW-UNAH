<div class="modal fade" id="nuevoProductoModal" tabindex="-1" role="dialog" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
     <div class="modal-dialog" role="document">
          <div class="modal-content">

               <div class="modal-body p-0">
                    <div class="container px-0">
                         <div class="row">
                              <div class="col">
                                   <div class="card card-signin flex-row">

                                        <div class="card-body">

                                          <form class="form-signin">
                                               <div class="form-label-group">
                                                 Seleccione una Categoria
                                                    <div class="input-group">
                                                      <select class="form-control" id="select-categorias" onchange="cambioCategoria();">
                                                      </select>
                                                    </div>
                                                </div>
                                                <div class="form-label-group">
                                                  Codigo de Barra
                                                     <input type="number" pattern="[0-9]+" id="input-barcode" class="form-control" placeholder="Codigo de Barra" required>
                                                </div>
                                                <div class="form-label-group">
                                                  Ubicacion
                                                  <div class="input-group">
                                                       <select class="form-control" id="select-contenedor"></select>
                                                  </div>
                                                </div>
                                                <div class="form-label-group">
                                                  Marca
                                                  <div class="input-group">
                                                       <select class="form-control" id="select-marcas"></select>
                                                  </div>
                                                </div>
                                                <div class="form-label-group">
                                                  Proveedor
                                                  <div class="input-group">
                                                       <select class="form-control" id="select-proveedores"></select>
                                                  </div>
                                                </div>
                                                <div id="div-detalles">
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
                    <button type="button" class="btn btn-primary" onclick="registraEmpleado();">Guardar</button>
               </div>
          </div>
     </div>
</div>
<?php include(SECCIONES . 'success-modal.php'); ?>
