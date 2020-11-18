<div class="container-fluid">
     <!-- DataTales Example -->
     <div class="card shadow mb-4">

          <div class="card-body">
               <div class="table-responsive">
                    <!-- Inicio Filtro y Busqueda -->
                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">



                         <div class="form-label-group">

                              <div class="row">
                                   <div style='text-align:left' class="col-md-6">
                                        <h4 for="tel2" class="col-md-12 ">Autoservicio "El Boulevard"</h4>
                                        <p for="tel2" class="col-md-12">
                                             Razon social del cliente <br>
                                             R.T.N.:0101010101010 <br>
                                             Boulevard Chorotega, Contiguo a Expresso Americano, 77199 Ciudad Choluteca,Honduras <br>
                                             TEL.:(504)3307-8867 <br>
                                             Email: s.benitez@yahoo.com <br>
                                        </p>
                                   </div>

                                   <div style='text-align:right' class="col-md-6">

                                        <H5 for="tel2" class="col-md-12"> Factura No. XXXXXXXX<br></H5>



                                   </div>
                              </div>

                              <div class="row">
                                   

                                   <div class="col-md-6">
                                        <input type="text" id="nombreCliente" class="form-control" placeholder="Cliente" required autofocus>
                                   </div>
                                   
                                   <div >  
                                       <button type="button" class="btn btn-primary"  data-target=""><i class="fas fa-search"></i></button>
                                   </div>

                                   <br>
                                   <div class="col-md-4">
                                        <input type="text" id="RTNCliente" class="form-control" placeholder="RTN" autofocus>
                                   </div>
                              </div>
                              <br>

                              <div class="row">

                                   <label for="tel2" class="col-md-1 control-label">Fecha</label>
                                   <div class="col-md-3">
                                        <input type="text" class="form-control input-sm" id="fecha" value="<?php echo date("d/m/Y"); ?>" readonly>
                                   </div>

                                   <h6>Empleado</h6>
                                   <div class="col-md-6">
                                        <input type="text" value="<?php echo JWTokens::GetData($_COOKIE['token'])['nombre']?>" readonly class="form-control">
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
