<div class="container-fluid">
  <div class="card shadow mb-4">
    <br>
    <div class="row justify-content-center">
      <div class="col-3">
        <div class="dropdown">
          <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Menu
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a id="addPlanilla" class="dropdown-item" href="#" data-toggle="modal" data-target="#nuevaPlanillaModal">Nueva Planilla</a>
            <a id="addDeduccion" class="dropdown-item" href="#" data-toggle="modal" data-target="#nuevaDeduccionModal">Agregar Deduccion</a>
            <a id="addBono" class="dropdown-item" href="#" data-toggle="modal" data-target="#nuevoBonoModal">Agregar Bono</a>
          </div>
        </div>
      </div>
      <div class="col-3">
          <select class="form-control" id="fechas-planilla">
            <option>seleccionar fecha</option>
            <!-- <?php //Planilla::llenarFechas($conexion); ?> -->
          </select>
      </div>
      <div class="col-3">
        <button type="button" class="btn btn-primary" onclick="planilla()">Mostrar</button>
      </div>
      <div class="col-2">
        <button type="button" id="pagarPlanilla" class="btn btn-success" onclick="actualizarEstado('P')">Pagar Planila</button>
      </div>
    </div><br>

              <div class="card-body">
                <div class="table-responsive">
                
                  <table class="table table-bordered" id="dataTablePlanilla" width="100%" cellspacing="0">
                    <thead>
                      <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Cargo</th>
                        <th>Fecha Inicio</th>
                        <th>Deducciones</th>
                        <th>Bonos</th>
                        <th>Sueldo</th>
                        <th>Total</th>
                        <th>Estado</th>
                      </tr>
                    </thead>
                    
                    <tbody id="tplanilla">
                    <!-- contenido de la tabla planilla -->
                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>


  <!-- modal que muestra las deducciones -->
  <div class="modal fade" id="deducciones" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <div class="row">
            <h5 class="modal-title titulo-tabla" id="exampleModalLabel">Deducciones</h5>
          </div>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">

            <div class="dropdown">
              <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Menu
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a id="verDeducciones" class="dropdown-item" href="#" onclick="cambiarTabla('Deducciones')">Deducciones</a>
                <a id="verAdelantos" class="dropdown-item" href="#" onclick="cambiarTabla('Adelantos')">Adelantos</a>
              </div>
            </div><br>

          <div class="tabla-deducciones">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Descripcion</th>
                  <th>Fecha</th>
                  <th>Monto</th>
                </tr>
              </thead>
            <tbody class="tdeducciones">
              
            </tbody>
            </table>
          </div>

          <div class="tabla-adelantos" style="display:none">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Descripcion</th>
                  <th>Fecha</th>
                  <th>Monto</th>
                </tr>
              </thead>
            <tbody class="tadelantos">
                
            </tbody>
            </table>
          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


  <!-- modal que muestra los bonos -->
  <div class="modal fade" id="bonos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Bonos</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <table class="table table-striped">
            <thead>
              <tr>
            <th>Descripcion</th>
            <th>Fecha</th>
              <th>Monto</th>
            </tr>
              
            </thead>
            <tbody class="tbonos">
              
            </tbody>
          </table>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


</div>