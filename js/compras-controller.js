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

var registrarCompra = async function(){
  let numFactura = document.getElementById('numFactura').value;
  let nom_proveedor = document.getElementById('nom_proveedor').value;
  let fechaFactura = document.getElementById('fechaFactura').value;
  let ISV = document.getElementById('ISV').value;
  let descuento = document.getElementById('descuento').value;
  let total = document.getElementById('total').value;


      let compra = {
        numFactura : numFactura,
        nom_proveedor : nom_proveedor,
        fechaFactura : fechaFactura,
        ISV : ISV,
        descuento : descuento,
        total : total
      }

        let respuesta=null;
      if (modo) {
        respuesta = await nuevoRegistro(compra, "compras");
    //  }else{
      //  respuesta = await actualizaRegistro(cliente, "clientes");
      }

      if(respuesta!=null){
        if(respuesta.res=='OK'){
          document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
          $('#nueva-compra-modal').modal('hide');
          $('#modal-success').modal('show');
          setTimeout(()=>$('#modal-success').modal('hide'), 2000);
          limpiarModal();
          mostrarCompras();
        }else{
          document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
          document.getElementById('errorMessage').style='display:block';
        }
      }
}

var registrarCompraDetalle = async function(){
  let numFactura = document.getElementById('numFactura').value;
  let producto = document.getElementById('producto').value;
  let cantidad = document.getElementById('cantidad').value;
  let precio = document.getElementById('precio').value;
  let ISV = document.getElementById('ISV').value;
  let descuento = document.getElementById('descuento').value;
  let total = document.getElementById('total').value;


      let compraDetalle = {
        numFactura : numFactura,
        producto : producto,
        cantidad : cantidad,
        precio : precio,
        ISV : ISV,
        descuento : descuento,
        total : total
      }

        let respuesta=null;
      if (modo) {
        respuesta = await nuevoRegistro(compraDetalle, "comprasDetalle");
    //  }else{
      //  respuesta = await actualizaRegistro(cliente, "clientes");
      }

      if(respuesta!=null){
        if(respuesta.res=='OK'){
          document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
          $('#nueva-compradetalle-modal').modal('hide');
          $('#modal-success').modal('show');
          setTimeout(()=>$('#modal-success').modal('hide'), 2000);
          limpiarModal();
          mostrarCompras();
        }else{
          document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
          document.getElementById('errorMessage').style='display:block';
        }
      }
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
