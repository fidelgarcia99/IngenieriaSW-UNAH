var modo = true
var id=null;
var confirm=false;

function selectRow(idRow,row){
  if(id==null){
    id=idRow;
    document.getElementById('btnEdit').disabled=false;
    document.getElementById('btnDelete').disabled=false;
  }else if(id==idRow){
    id=null;
    document.getElementById('btnEdit').disabled=true;
    document.getElementById('btnDelete').disabled=true;
  }
}

function mouseOverRow(row){
  if(id==null)
  row.style="background-color:cornsilk;cursor:pointer";
}

function mouseOutRow(row){
  if(id==null)
  row.style="background-color:white;";
}

var mostrarProveedores = function(){
  renderTabla(null,null,'proveedores');
}

var registrarProveedor = async function(){
  let nombreP = document.getElementById('nombreP').value;
  let direccionP = document.getElementById('direccionP').value;
  let correoP = document.getElementById('correoP').value;
  let telefonoP = document.getElementById('telefonoP').value;

      let proveedor = {
        nombreP: nombreP,
        direccionP: direccionP,
        correoP: correoP,
        telefonoP: telefonoP
      }
      let respuesta = await nuevoRegistro(proveedor, "proveedores");

      if(respuesta!=null){
        if(respuesta.res=='OK'){
          document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
          $('#nuevoProveedorModal').modal('hide');
          $('#modal-success').modal('show');
          setTimeout(()=>$('#modal-success').modal('hide'), 2000);
          document.getElementById('nombreP').value='';
          document.getElementById('direccionP').value='';
          document.getElementById('correoP').value='';
          document.getElementById('telefonoP').value='';
          mostrarProveedores();
        }else{
          document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
          document.getElementById('errorMessage').style='display:block';
        }
      }
};


var eliminarRegistro = async function(){
  if (confirm) {
    let data = {id:id}
    let respuesta = await eliminarRegistroId(data,"proveedores");
    if(respuesta!=null){
      if(respuesta.res=='OK'){
        document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
        $('#modal-confirm').modal('hide');
        $('#modal-success').modal('show');
        setTimeout(()=>$('#modal-success').modal('hide'), 2000);
      }else{
        console.error('El Servidor no ha devuelto nada.');
      }
      confirm=false;
     mostrarProveedores();
    }
  }else{
      document.getElementById('modal-confirm-msj').innerHTML=`Esta a punto de eliminar el registro con Id:${id}.`;
      $('#modal-confirm').modal('show');
  }
}

mostrarProveedores();
