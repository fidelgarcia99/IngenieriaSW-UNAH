<div class="container-fluid">
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary"><?php echo $_GET['view']?></h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
       <!-- Inicio Filtro y Busqueda -->
       <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                <div class="row"><div class="col-sm-12 col-md-6">
                  <div class="dataTables_length" id="dataTable_length">
                    <label>Filtrar <select id="select_Filtro" name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                    <option value="">-----</option>
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
          <thead id="thead">
            
          </thead>
          <tbody id="tbody">
            
          </tbody>
        </table>
      </div>
    </div>
  </div>

</div>