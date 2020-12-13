function selectRow(idRow,row){
    tabla=document.getElementById('detalle-compra-tabla');
    document.getElementById('modal-titulo').innerHTML='Detalles de Factura';
    renderTabla('id',idRow,'ventas',tabla);
    $('#detalle-compra-modal').modal('show');
}

function mouseOverRow(row){
  row.style="background-color:cornsilk;cursor:pointer";
}

function mouseOutRow(row){
  row.style="background-color:white;";
}

function mostrarVentas(){
  var tabla = document.getElementById('dataTable');
  renderTabla(null,null,"ventas",tabla);
}

mostrarVentas();
