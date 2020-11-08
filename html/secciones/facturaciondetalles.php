<div class="container-fluid">
     <!-- DataTales Example -->
     <div class="card shadow mb-4">

          <div class="card-body">
               <div class="table-responsive">
                    <!-- Inicio Filtro y Busqueda -->
                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                         <div class="row">
                              <div style='text-align:left'>
                                   <h4 for="tel2" class="col-md-12 ">Autoservicio "El Boulevard"</h4>
                                   <p for="tel2" class="col-md-12">
                                        Razon social del cliente <br>
                                        R.T.N.:0101010101010 <br>
                                        DIRECCION <br>
                                        TEL.:(504)0000-1111 <br>
                                        Email: XXXXXXX@XXXXXXX.com <br>
                                   </p>
                              </div>

                              <div style='text-align:right' class="col-md-12">


                              </div>
                         </div>


                         <div class="form-label-group" style='text-align:left'>

                              <div class="row">

                                   <div class="col-md-6">
                                        <input type="text" id="nombreCliente" class="form-control" placeholder="Cliente" required autofocus>

                                   </div>

                                   <br>
                                   <div class="col-md-6">
                                        <input type="text" id="RTNCliente" class="form-control" placeholder="RTN" autofocus>
                                   </div>
                              </div>
<br>

                              <div class="row">

                                   <label for="tel2" class="col-md-1 control-label">Fecha</label>
                                   <div class="col-md-2">
                                        <input type="text" class="form-control input-sm" id="fecha" value="<?php echo date("d/m/Y"); ?>" readonly>
                                   </div>

                                   <h6>Empleado</h6>
                                   <div class="col-md-3">
                                        <select class="form-control" id="selectCargo">

                                             <?php Empleado::llenarEmpleados($conexion); ?>

                                        </select>
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

                    <div style='text-align:right' >
<p class="col-md-10">
     Total
</p>

                              </div>
               </div>
          </div>
     </div>

</div>