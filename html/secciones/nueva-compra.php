

<div class="container-fluid m-0 p-0 h-100">
     <!-- DataTales Example -->
     <div class="card shadow h-100">

          <div class="card-body">
               <div class="table-responsive">
                    <!-- Inicio Filtro y Busqueda -->
                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">

                         <div class="container-fluid">
                              <div class="row">
                                   <div class="col-12">
                                     <div class="alert alert-danger" role="alert" style="display:none" id="div-error">
                                        This is a danger alert—check it out!
                                      </div>
                                   </div>
                              </div>

                              <div class="row mb-2">
                                   <div class="col-md-6">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">No. Factura</div>
                                       </div>
                                       <input type="text" id="input-numero-factura" class="form-control" onchange="validaCampos2()" onfocusin="noscan()" onfocusout="siscan()" required>
                                     </div>
                                   </div>
                                   <div class="col-md-6">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">Proveedor</div>
                                       </div>
                                       <select class="form-control" id="select-proveedor" onchange="validaCampos2()"></select>
                                     </div>
                                   </div>
                              </div>
                              <div class="row mb-5">
                                <div class="col-md-3">
                                  <div class="input-group">
                                    <div class="input-group-prepend">
                                      <div class="input-group-text">Fecha</div>
                                    </div>
                                    <input type="date" id="input-fecha" class="form-control" onchange="validaCampos2()" onfocusin="noscan()" onfocusout="siscan()" required>
                                  </div>
                                </div>
                              </div>

                              <div class="row mb-2">
                                   <div class="col-md-6">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">Codigo</div>
                                       </div>
                                       <input type="number" id="input-codigo" class="form-control" onchange="validaCampos()" onkeypress="enter(event)" onfocusin="noscan()" onfocusout="siscan()" required>
                                     </div>
                                   </div>
                                   <div class="col-md-1">
                                     <div class="input-group">
                                       <button type="button" class="btn btn-primary" onclick="buscaProducto();" id="btn-buscar">Buscar</button>
                                     </div>
                                   </div>
                                   <div class="col-md-1">
                                     <div class="input-group">
                                       <button type="button" class="btn btn-success" onclick="añadirProducto();" id="btn-agregar" disabled>Agregar</button>
                                     </div>
                                   </div>
                              </div>
                              <div class="row mb-2">
                                   <div class="col-md-12">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">Descripcion</div>
                                       </div>
                                       <input type="text" id="input-descripcion" class="form-control" readonly>
                                     </div>
                                   </div>
                              </div>
                              <div class="row mb-2">
                                   <div class="col-md-4">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">Paquete</div>
                                       </div>
                                       <input type="number" id="input-paquetes" class="form-control" onchange="cambiarCantidad();validaCampos();" min="1" onfocusin="noscan()" onfocusout="siscan()" required>
                                     </div>
                                   </div>
                                   <div class="col-md-4">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">Unidades</div>
                                       </div>
                                       <input type="number" id="input-unidades" class="form-control" onchange="cambiarCantidad();validaCampos();" min="1" onfocusin="noscan()" onfocusout="siscan()" required>
                                     </div>
                                   </div>
                                   <div class="col-md-4">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">Cantidad</div>
                                       </div>
                                       <input type="number" id="input-cantidad" class="form-control" onchange="validaCampos();" onfocusin="noscan()" onfocusout="siscan()" readonly>
                                     </div>
                                   </div>
                              </div>
                              <div class="row">
                                <div class="col-md-4">
                                  <div class="input-group">
                                    <div class="input-group-prepend">
                                      <div class="input-group-text">Costo Paquete</div>
                                    </div>
                                    <input type="number" id="input-precio-compra" class="form-control" onchange="validaCampos()" onfocusin="noscan()" onfocusout="siscan()" required>
                                    <div class="input-group-text">Lps.</div>
                                  </div>
                                </div>
                                <div class="col-md-4">
                                  <div class="input-group">
                                    <div class="input-group-prepend">
                                      <div class="input-group-text">Descuento</div>
                                    </div>
                                    <input type="number" id="input-descuento" class="form-control" onchange="validaCampos()" onfocusin="noscan()" onfocusout="siscan()" required>
                                    <div class="input-group-text">Lps.</div>
                                  </div>
                                </div>
                                <div class="col-md-4">
                                  <div class="input-group">
                                    <div class="input-group-prepend">
                                      <div class="input-group-text">Precio Unidad</div>
                                    </div>
                                    <input type="number" id="input-precio-venta" class="form-control" onchange="validaCampos()" onfocusin="noscan()" onfocusout="siscan()" required>
                                    <div class="input-group-text">Lps.</div>
                                  </div>
                                </div>
                              </div>
                         </div>

                    </div>
                    <br>
                    <!-- Fin Filtro y Busqueda -->
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                         <thead id="thead">
                              <th style="width:50px">Cantidad</th>
                              <th>Barcode</th>
                              <th>Descripcion</th>
                              <th>Costo</th>
                              <th>Precio Venta</th>
                              <th>Descuento</th>
                              <th>Total</th>
                              <th style="width:50px">Quitar</th>
                         </thead>
                         <tbody id="tbody">
                         </tbody>
                    </table>
               </div>
               <div class="row">
                    <div class="col-4">
                         <div class="input-group mb-2">
                           <div class="input-group-prepend">
                             <div class="input-group-text">SubTotal</div>
                           </div>
                           <input type="number" class="form-control input-sm" id="input-subtotal" value="00.00" readonly>
                           <div class="input-group-prepend">
                             <div class="input-group-text">Lps.</div>
                           </div>
                         </div>
                    </div>
                    <div class="col-4">
                         <div class="input-group mb-2">
                           <div class="input-group-prepend">
                             <div class="input-group-text">Descuento</div>
                           </div>
                           <input type="number" class="form-control input-sm" id="input-descuento" value="00.00" readonly>
                           <div class="input-group-text">Lps.</div>
                         </div>
                    </div>
               </div>
               <div class="row mb-2">
                 <div class="col-4">
                      <div class="input-group mb-2">
                        <div class="input-group-prepend">
                          <div class="input-group-text">IVS</div>
                        </div>
                        <input type="numbre" class="form-control input-sm" id="input-ivs" value="00.00" readonly>
                        <div class="input-group-text">Lps.</div>
                      </div>
                 </div>
                 <div class="col-4">
                      <div class="input-group mb-2">
                        <div class="input-group-prepend">
                          <div class="input-group-text">Total</div>
                        </div>
                        <input type="number" class="form-control input-sm" id="input-total" value="00.00" readonly>
                        <div class="input-group-text">Lps.</div>
                      </div>
                 </div>
               </div>
               <div class="row">
                 <div class="col-1">
                      <div class="input-group mb-2">
                        <button type="button" id="btn-guardar" class="btn btn-success" onclick="registrarCompra()" disabled><i class="fas fa-save"></i> Guardar</button>
                      </div>
                 </div>
                 <div class="col-9">
                 </div>
                 <div class="col-1">
                      <div class="input-group mb-2">
                        <a href="?view=compras" class="btn btn-primary"><i class="fas fa-arrow-alt-circle-left"></i> Regresar</a>
                      </div>
                 </div>
                 <div class="col-1">
                      <div class="input-group mb-2">
                        <button type="button" id="btn-limpiar" class="btn btn-warning" onclick="limpiarFactura()"><i class="fas fa-eraser"></i> Limpiar</button>
                      </div>
                 </div>
               </div>

          </div>
     </div>

</div>
<?php include(SECCIONES . 'success-modal.php') ?>
