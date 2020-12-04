

<div class="container-fluid m-0 p-0 h-100">
     <!-- DataTales Example -->
     <div class="card shadow h-100">

          <div class="card-body">
               <div class="table-responsive">
                    <!-- Inicio Filtro y Busqueda -->
                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">

                         <div class="container-fluid">

                              <div class="row">
                                   <div class="col-5">
                                        <div class="input-group mb-2">
                                          <div class="input-group-prepend">
                                            <div class="input-group-text">Factura No.</div>
                                          </div>
                                          <input type="text" class="form-control input-sm" id="nFactura" value="00000" readonly>
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
                                       <input type="text" id="nombreCliente" class="form-control" required value="Consumidor Final">
                                     </div>
                                   </div>
                                   <div class="col-md-5">
                                     <div class="input-group">
                                       <div class="input-group-prepend">
                                         <div class="input-group-text">RTN</div>
                                       </div>
                                       <input type="number" id="RTNCliente" class="form-control" required>
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
                                       <input type="number" id="input-codigo" class="form-control" required>
                                     </div>
                                   </div>
                                   
                              </div>
                         </div>

                    </div>
                    <br>
                    <!-- Fin Filtro y Busqueda -->
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                         <thead id="thead">
                              <th>Cantidad</th>
                              <th>Descripcion</th>
                              <th>Precio Unitario</th>
                              <th>Descuento o Rebajas Otorgados</th>
                              <th>Total</th>
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
                           <input type="number" class="form-control input-sm" id="nFactura" value="00.00" readonly>
                         </div>
                    </div>
               </div>
               <div class="row">
                    <div class="col-4">
                         <div class="input-group mb-2">
                           <div class="input-group-prepend">
                             <div class="input-group-text">Descuento</div>
                           </div>
                           <input type="number" class="form-control input-sm" id="nFactura" value="00000" readonly>
                         </div>
                    </div>
               </div>
               <div class="row">
                    <div class="col-4">
                         <div class="input-group mb-2">
                           <div class="input-group-prepend">
                             <div class="input-group-text">IVS</div>
                           </div>
                           <input type="numbre" class="form-control input-sm" id="nFactura" value="00000" readonly>
                         </div>
                    </div>
               </div>
               <div class="row">
                    <div class="col-4">
                         <div class="input-group mb-2">
                           <div class="input-group-prepend">
                             <div class="input-group-text">Total</div>
                           </div>
                           <input type="number" class="form-control input-sm" id="nFactura" value="00000" readonly>
                         </div>
                    </div>
               </div>
          </div>
     </div>

</div>
