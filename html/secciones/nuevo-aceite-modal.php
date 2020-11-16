<div class="modal fade" id="nuevoAceiteModal" tabindex="-1" role="dialog" data-focus-on="input:first" style="display: none;" aria-labelledby="nuevoUsuarioModalLabel" aria-hidden="true">
     <div class="modal-dialog" role="document">
          <div class="modal-content">

               <div class="modal-body p-0">
                    <div class="container px-0">
                         <div class="row">
                              <div class="col">
                                   <div class="card card-signin flex-row">
                                        <div class="card-img-left d-none d-md-flex">
                                             <!-- Background image for card set in CSS! -->
                                        </div>
                                        <div class="card-body">
                                             <h5 class="card-title text-center">Nuevo Aceite</h5>
                                             <form class="form-signin">
                                                  <div class="form-label-group">
                                                       <h6>Especificaciones del Aceite</h6>
                                                       <div class="input-group">
                                                            <input type="text" id="inputnombre_producto" class="form-control" placeholder="Nombre Aceite" required autofocus>
                                                       </div>
                                                       <br>
                                                       <div class="input-group">
                                                            <input type="text" id="inputTipoMotor" class="form-control" placeholder="Tipo de Motor" required autofocus>
                                                       </div>
                                                       <br>
                                                       <div class="input-group">
                                                            <input type="text" id="inputViscosidad" class="form-control" placeholder="Viscosidad" required autofocus>
                                                       </div>
                                                       <br>
                                                       <div class="input-group">
                                                            <input type="number" pattern="[0-9]+" id="inputTemIn" class="form-control" placeholder="Temperatura Invierno" required>
                                                            <br>
                                                            <input type="number" pattern="[0-9]+" id="inputTemGen" class="form-control" placeholder="Temperatura General" required>
                                                       </div>
                                                       <br>
                                                       <h6>Fecha de Elaboración</h6>
                                                       <div class="form-label-group">
                                                            <input type="date" id="inputfEla" class="form-control" required>
                                                       </div>

                                                       <h6>Fecha de Vencimiento</h6>
                                                       <div class="form-label-group">
                                                            <input type="date" id="inputfVen" class="form-control" required>
                                                       </div>

                                                       <hr>

                                                       <h6>Datos Empresariales</h6>
                                                       <div class="form-label-group">
                                                            <input type="number" pattern="[0-9]+" id="inputcod_barra" class="form-control" placeholder="Codigo de Barra" required>
                                                       </div>
                                                       <div class="input-group">
                                                            <input type="number" pattern="[0-9]+" id="inputprecioCosto" class="form-control" placeholder="Precio Costo" required>
                                                            <br>
                                                            <input type="number" pattern="[0-9]+" id="inputprecioVenta" class="form-control" placeholder="PrecioVenta" required>
                                                       </div>

                                                       <br>
                                                       <h6>Proveedor</h6>
                                                       <div class="form-label-group">
                                                            <select class="form-control" id="nom_ciudad">

                                                                 <?php producto::llenarProveedor($conexion); ?>

                                                            </select>
                                                       </div>



                                                       <div class="input-group">
                                                            <input type="number" pattern="[0-9]+" id="inputcantidad" class="form-control" placeholder="Cantidad" required>

                                                       </div>


                                                       <br>

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
                    <button type="button" class="btn btn-primary" onclick="registraEmpleado();">Registrar</button>
               </div>
          </div>
     </div>
</div>
<?php include(SECCIONES . 'success-modal.php'); ?>



