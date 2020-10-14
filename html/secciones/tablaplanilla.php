<div class="container-fluid">
<div class="card shadow mb-4">
  <br>
  <div class="row justify-content-center">
    <div class="col-3">
       <select class="form-control" id="fechas-planilla">
          <option selected="">seleccionar fecha</option>
          <?php Personas::llenarFechas($conexion); ?>
       </select>
    </div>
    <div class="col-2">
      <button type="button" class="btn btn-primary" onclick="planilla()">Mostrar</button>
    </div>
  </div>

            <div class="card-body">
              <div class="table-responsive">
              
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Nombre</th>
                      <th>Apellido</th>
                      <th>Cargo</th>
                      <th>Fecha Inicio</th>
                      <th>Deducciones</th>
                      <th>Bonos</th>
                      <th>Sueldo</th>
                      
                    </tr>
                  </thead>
                  
                  <tbody class="tplanilla">
                   <?php
                      Personas::empleados($conexion, 1);
                   ?>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
<!-- modal que muestra las deducciones -->
  <div class="modal fade" id="deducciones" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Deducciones</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-striped">
          <thead>
             <tr>
          <th>fecha</th>
            <th>Monto</th>
          </tr>
          </thead>
         <tbody class="tdeducciones">
           
         </tbody>
        </table>

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