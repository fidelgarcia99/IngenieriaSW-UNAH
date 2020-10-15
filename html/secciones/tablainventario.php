<div class="container-fluid">

          <!-- Page Heading -->
          

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Producto en Inventario</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                
          <!-- Inicio Filtro y Busqueda -->
              <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                <div class="row"><div class="col-sm-12 col-md-6">
                  <div class="dataTables_length" id="dataTable_length">
                    <label>Filtrar <select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                    <option value="">-----</option>
                      <option value="marca">Marca</option>
                      <option value="proveedor">Proveedor</option>
                      <option value="precio">Precio</option>
                      <option value="ingreso">Fecha de Ingreso</option>
                      <option value="expiracion">Fecha de Expiración</option>
                    </select> </label></div></div><div class="col-sm-12 col-md-6">
                      <div id="dataTable_filter" class="dataTables_filter">
                        <label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
                      </label>
                    </div>
                  </div>
                </div>
                <div class="row"><div class="col-sm-12"><table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
          <!-- Fin Filtro y Busqueda -->
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                <br>

                
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Nombre</th>
                      <th>Marca</th>
                      <th>Proveedor</th>
                      <th>Precio</th>
                      <th>Fecha de Ingreso</th>
                      <th>Fecha de Expiración</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Id</th>
                      <th>Nombre</th>
                      <th>Marca</th>
                      <th>Proveedor</th>
                      <th>Precio</th>
                      <th>Fecha de Ingreso</th>
                      <th>Fecha de Expiración</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <tr>
                      <td>01</td>
                      <td>System Architect</td>
                      <td>Edinburgh</td>
                      <td>61</td>
                      <td>$320,800</td>
                      <td>2011/04/25</td>
                      <td>2012/04/25</td>
                    </tr>
                    <tr>
                      <td>02</td>
                      <td>Accountant</td>
                      <td>Tokyo</td>
                      <td>63</td>
                      <td>$170,750</td>
                      <td>2011/07/25</td>
                      <td>2013/07/25</td>
                    </tr>
                    <tr>
                    
                   
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>