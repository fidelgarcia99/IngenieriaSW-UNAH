var modo = true
var id=null;
var confirm=false;

function selectRow(idRow,row){
    tabla=document.getElementById('detalle-compra-tabla');
    document.getElementById('modal-titulo').innerHTML='Detalles de Factura';
    renderTabla('id',idRow,'compras',tabla);
    $('#detalle-compra-modal').modal('show');
}

function mouseOverRow(row){
  row.style="background-color:cornsilk;cursor:pointer";
}

function mouseOutRow(row){
  row.style="background-color:white;";
}

function mostrarCompras(){
  var tabla = document.getElementById('dataTable');
  renderTabla(null,null,"compras",tabla);
}


var limpiarModal = function(){
  document.getElementById('numFactura').value='';
  document.getElementById('nom_proveedor').value='';
  document.getElementById('fechaFactura').value='';
  document.getElementById('ISV').value='';
  document.getElementById('descuento').value='';
  document.getElementById('total').value='';
  document.getElementById('modal-titulo').innerHTML="Nueva Compra";
  modo=true;
  confirm=false;
  selectId=null;
}

mostrarCompras();
