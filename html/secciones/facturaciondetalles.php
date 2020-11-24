

<div class="container-fluid m-0 p-0">
     <!-- DataTales Example -->
     <div class="card shadow mb-4">

          <div class="card-body">
               <div class="table-responsive">
                    <!-- Inicio Filtro y Busqueda -->
                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">

                         <div class="container-fluid">

                              <div class="row">
                                   <div class="col-8">
                                        <h4 for="tel2" class="col-md-12 ">Autoservicio "El Boulevard"</h4>
                                        <p for="tel2" class="col-md-12">
                                             R.T.N.:0101010101010 <br>
                                             Boulevard Chorotega, Contiguo a Expresso Americano, 77199 Ciudad Choluteca,Honduras <br>
                                             TEL.:(504)3307-8867 <br>
                                             Email: s.benitez@yahoo.com <br>
                                        </p>
                                   </div>

                                   <div class="col-4">

                                        <div class="input-group mb-2">
                                          <div class="input-group-prepend">
                                            <div class="input-group-text">Factura No.</div>
                                          </div>
                                          <input type="text" class="form-control input-sm" id="nFactura" value="00000" readonly>
                                        </div>
                                        <!--<div class="input-group mb-2">
                                          <div class="input-group-prepend">
                                            <div class="input-group-text">Fecha</div>
                                          </div>
                                          <input type="text" class="form-control input-sm" id="fecha" value="<?php echo date("d/m/Y"); ?>" readonly>
                                        </div> -->
                                        <div class="input-group mb-2">
                                          <div class="input-group-prepend">
                                            <div class="input-group-text">Cajero</div>
                                          </div>
                                          <input type="text" value="<?php echo JWTokens::GetData($_COOKIE['token'])['nombre']?>" readonly class="form-control">
                                        </div>
                                   </div>

                              </div>

                              <div class="row mb-2">
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
                              <div id="errorMessage" class="row alert alert-danger mb-2" style="display:none">
                                Hubo un problema
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
                              <tr>
                                   <td></td>
                                   <td></td>
                                   <td></td>
                                   <td></td>
                                   <td></td>
                              </tr>

                              <tr>
                                   <td></td>
                                   <td></td>
                                   <td></td>
                                   <td></td>
                                   <td></td>
                              </tr>



                         </tbody>
                    </table>

                    <div style='text-align:RIGHT'>
                         <p class="col-md-10">
                              Total
                         </p>

                         <DIV style='text-align:LEFT'> <B>"La factura es beneficio de todos ¡EXIJALA!"</B> </DIV>
                         <hr>

                         <div class="row">

                              <div class="col-md-6" style='text-align:left'>


                                   <TABLE class="table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <TR>
                                             <TH>No. correlativo de orden de compra exenta</TH>
                                             <TD>Item 1</TD>

                                        </TR>
                                        <TR>
                                             <TH>No. correlativo de constancia de registro exonerado</TH>
                                             <TD>Item 2</TD>

                                        </TR>
                                        <TR>
                                             <TH>No. identificativo del registro de la SAG</TH>
                                             <TD>Item 3</TD>

                                        </TR>
                                   </TABLE>
                              </div>

                              <br>
                              <div class="col-md-6" style='text-align:left'>
                                   <TABLE class="table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <TR>
                                             <TH>Importe Exonerado L.</TH>
                                             <TD>Item 1</TD>

                                        </TR>
                                        <TR>
                                             <TH>Importe Exento L.</TH>
                                             <TD>Item 2</TD>

                                        </TR>
                                        <TR>
                                             <TH>Importe Gravado 15%</TH>
                                             <TD>Item 3</TD>

                                        </TR>

                                        <TR>
                                             <TH>Importe Gravado 18%</TH>
                                             <TD>Item 4</TD>

                                        </TR>
                                        <TR>
                                             <TH>I.S.V 15%</TH>
                                             <TD>Item 5</TD>

                                        </TR>

                                        <TR>
                                             <TH>I.S.V 18%</TH>
                                             <TD>Item 6</TD>

                                        </TR>

                                        <TR>
                                             <TH>TOTAL A PAGAR L.</TH>
                                             <TD>Item 7</TD>

                                        </TR>
                                   </TABLE>

                              </div>
                         </div>
                         <br>
                    </div>
               </div>
          </div>
     </div>

</div>
