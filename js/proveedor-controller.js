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
  tabla = document.getElementById('dataTable');
  renderTabla(null,null,'proveedores',tabla);
}

var registrarProveedor = async function(){
  let nombreP = document.getElementById('nombreP').value;
  let direccionP = document.getElementById('direccionP').value;
  let correoP = document.getElementById('correoP').value;
  let telefonoP = document.getElementById('telefonoP').value;

      let proveedor = {
        id:id,
        nombreP: nombreP,
        direccionP: direccionP,
        correoP: correoP,
        telefonoP: telefonoP
      }
      let respuesta=null;
      if (modo) {
        respuesta = await nuevoRegistro(proveedor, "proveedores");
      }else{
        respuesta = await actualizaRegistro(proveedor, "proveedores");
        selectRow(id);
      }

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

var editarRegistro = function(){
  let proveedor = obtenerRegistros('id', id, 'proveedores');
  proveedor.then(data=>{
    console.log(data);
    if(data){
      data = data[0];
      document.getElementById('nombreP').value = data.Nombre;
      document.getElementById('direccionP').value = data.Direccion;
      document.getElementById('correoP').value = data.Email;
      document.getElementById('telefonoP').value = data.Telefono;

      document.getElementById('modal-titulo').innerHTML = "Editar Proveedor";
      modo = false
      $('#nuevoProveedorModal').modal('show');
    }else{
      console.error('El servidor no ha devuelto un resultado');
    }
  }).catch(error=>{
    console.error(error);
  });
}


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
