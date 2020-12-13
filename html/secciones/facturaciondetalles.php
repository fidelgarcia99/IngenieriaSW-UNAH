

<div class="container-fluid m-0 p-0 h-100">
     <!-- DataTales Example -->
     <div class="card shadow h-100">

          <div class="card-body">
               <div class="table-responsive">
                    <!-- Inicio Filtro y Busqueda -->
                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">

                         <div class="container-fluid">


                              <div class="row">

                                <nav class="navbar navbar-expand-lg navbar-light bg-light mb-2">
                                  <div class="collapse navbar-collapse" id="navbarNav">
                                    <ul class="navbar-nav">
                                      <li class="nav-item mx-1 active">
                                        <button type="button" class="btn btn-secondary">Nueva Factura Ctrl+1</button>
                                      </li>
                                      <li class="nav-item mx-1">
                                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#nuevoConsulta">Consultar Precio Ctrl+2</button>
                                      </li>
                                      <li class="nav-item mx-1">
                                        <button type="button" onclick="adelantoEmpleado();" class="btn btn-secondary">Adelanto Empleados Ctrl+3</button>
                                      </li>
                                    </ul>
                                  </div>
                                </nav>

                              </div>


                              <div class="row">
                                   <div class="col-12">
                                     <div class="alert alert-danger" role="alert" style="display:none" id="div-error">
                                        This is a danger alert—check it out!
                                      </div>
                                   </div>
                              </div>

                              <div class="row">
                                   <div class="col-5">
                                        <div class="input-group mb-2">
                                          <div class="input-group-prepend">
                                            <div class="input-group-text">Factura No.</div>
                                          </div>
                                          <input type="text" class="form-control input-sm" id="input-numero-factura" value="000" readonly>
                                        </div>
                                   </div>
                                   <div class="col-5">
                                        <div class="input-group mb-2">
                                          <div class="input-group-prepend">
                                            <div class="input-group-text">Cajero</div>
                                          </div>
                                          <input type="text" value="<?php echo JWTokens::GetData($_COOKIE['token'])['nombre']?>" readonly class="form-control">
                                        </div>
                                   </div>

                              </div>

                              <div class="row mb-5">
                                   <div class="col-md-5">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">Cliente</div>
                                       </div>
                                       <input type="text" id="input-cliente" class="form-control" required value="Consumidor Final" onchange="validaCampos()" onkeypress="escanearID(event);" onfocusin="onfocusInNombre(this)" onfocusout="onfocusOutNombre(this)">
                                     </div>
                                   </div>
                                   <div class="col-md-5">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">RTN</div>
                                       </div>
                                       <input type="number" id="input-rtn" class="form-control" onfocusin="noscan()" onfocusout="siscan()" required>
                                     </div>
                                   </div>
                                   <div class="col-2 mx-0 px-0">
                                       <button type="button" class="btn btn-primary" data-toggle="modal"  data-target="#nuevoClienteRtnModal" onclick="cargarClientes();"><i class="fas fa-search"></i></button>
                                       <button type="button" class="btn btn-primary"><i class="fas fa-save" onclick="guardarCliente();"></i></button>
                                   </div>
                              </div>

                              <div class="row">
                                   <div class="col-md-10">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">Codigo</div>
                                       </div>
                                       <input type="number" id="input-codigo" class="form-control" onkeypress="enter(event)" onfocusin="noscan()" onfocusout="siscan()" required>
                                     </div>
                                   </div>

                              </div>
                         </div>

                    </div>
                    <br>
                    <!-- Fin Filtro y Busqueda -->
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                         <thead id="thead">
                              <th style="width:100px;">Cantidad</th>
                              <th>Barcode</th>
                              <th>Descripcion</th>
                              <th>Precio</th>
                              <th>Descuento</th>
                              <th>Total</th>
                              <th style="width:100px;">Quitar</th>
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
                           <div class="input-group-text">Lps.</div>
                         </div>
                    </div>
               </div>
               <div class="row">
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
               <div class="row">
                    <div class="col-4">
                         <div class="input-group mb-2">
                           <div class="input-group-prepend">
                             <div class="input-group-text">IVS</div>
                           </div>
                           <input type="numbre" class="form-control input-sm" id="input-ivs" value="00.00" readonly>
                           <div class="input-group-text">Lps.</div>
                         </div>
                    </div>
               </div>
               <div class="row">
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
                        <button type="button" id="btn-guardar" class="btn btn-success" onclick="registrarVenta()" disabled><i class="fas fa-save"></i> Guardar</button>
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
