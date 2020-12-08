<div class="modal fade" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <div class="container-fluid">
          <div class="row mx-0 px-0">
            <div class="col-3">
            </div>
            <div class="col-9 mx-0 px-0">
              <i class="fas fa-check-circle mx-auto" id="modal-success-icon"></i>
            </div>
          </div>
          <div class="row mx-0 px-0">
            <div class="col-12 mx-0 px-0">
              <div id="modal-success-message" class="alert alert-success">
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  </div>

  <!-- Modal confirmar eliminar-->
<div class="modal fade" id="modal-confirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body" id="modal-confirm-msj">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="confirm=false;" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-danger" onclick="confirm=true;eliminarRegistro();">Confirmar</button>
      </div>
    </div>
  </div>
</div>

  <!-- Modal conformar despedir-->
  <div class="modal fade" id="modal-confirm-despedir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body" id="modal-confirm-despedir-msj">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="confirm=false;" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-danger" onclick="confirm=true;despedirEmpleado();">Confirmar</button>
      </div>
    </div>
  </div>
</div>

  <!-- Modal conformar despedir-->
  <div class="modal fade" id="modal-confirm-pagar-planilla" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body" id="modal-confirm-pagar-planilla-msj">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="confirm=false;" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-danger" onclick="confirm=true;actualizarEstado('P');">Confirmar</button>
      </div>
    </div>
  </div>
</div>