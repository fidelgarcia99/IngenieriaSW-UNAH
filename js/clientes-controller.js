var confirm = false;
var selectId = null;
var modo = true;

var mostrarClientes = function(){
  tabla=document.getElementById('dataTable');
  renderTabla(null,null,'clientes',tabla);
}

function selectRow(idRow,row){
  if(selectId==null){
    selectId=idRow;
    document.getElementById('btnEdit').disabled=false;
    document.getElementById('btnDelete').disabled=false;
  }else if(selectId==idRow){
    selectId=null;
    document.getElementById('btnEdit').disabled=true;
    document.getElementById('btnDelete').disabled=true;
  }
}

function mouseOverRow(row){
  if(selectId==null)
  row.style="background-color:cornsilk;cursor:pointer";
}

function mouseOutRow(row){
  if(selectId==null)
  row.style="background-color:white;";
}


var registrarCliente = async function(){
  let pnombre = document.getElementById('pNombreCliente').value;
  let snombre = document.getElementById('sNombreCliente').value;
  let papellido = document.getElementById('pApellidoCliente').value;
  let sapellido = document.getElementById('sApellidoCliente').value;
  let id = document.getElementById('inputId').value;
  let direccion = document.getElementById('direccion').value;
  let telefono = document.getElementById('numTelCliente').value;
  let ciudad = document.getElementById('nom_ciudad').value;
  let email = document.getElementById('inputEmail').value;

      let cliente = {
        idCliente:selectId,
        pnombre : pnombre,
        snombre : snombre,
        papellido : papellido,
        sapellido : sapellido,
        id : id,
        direccion : direccion,
        telefono : telefono,
        ciudad : ciudad,
        email : email
      }

      let respuesta=null;
      if (modo) {
        respuesta = await nuevoRegistro(cliente, "clientes");
      }else{
        respuesta = await actualizaRegistro(cliente, "clientes");
      }

      if(respuesta!=null){
        if(respuesta.res=='OK'){
          document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
          $('#nuevoClienteModal').modal('hide');
          $('#modal-success').modal('show');
          setTimeout(()=>$('#modal-success').modal('hide'), 2000);
          mostrarClientes();
          limpiarModal();
          selectId=null;
        }else{
          document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
          document.getElementById('errorMessage').style='display:block';
        }
      }
}

var editarRegistro = function(){
      let cliente = obtenerRegistros('id', selectId, 'clientes');
      cliente.then(data=>{
        if(data!=null){
          data = data[0];
          document.getElementById('pNombreCliente').value=data.pnombre;
          document.getElementById('sNombreCliente').value=data.snombre;
          document.getElementById('pApellidoCliente').value=data.papellido;
          document.getElementById('sApellidoCliente').value=data.sapellido;
          document.getElementById('inputId').value=data.id;
          document.getElementById('direccion').value=data.direccion;
          document.getElementById('numTelCliente').value=data.telefono;
          document.getElementById('nom_ciudad').value=data.ciudad;
          document.getElementById('inputEmail').value=data.email;
          document.getElementById('modal-titulo').innerHTML="Editar Cliente";
          modo = false;
          $('#nuevoClienteModal').modal('show');
        }else{
          console.error('El servidor no ha devuelto un resultado');
        }
      }).catch(error=>{
        console.error(error);
      });
}

var eliminarRegistro = async function(){
  if (confirm) {
    let data = {id:selectId}
    let respuesta = await eliminarRegistroId(data,"clientes")
    if(respuesta!=null){
      if(respuesta.res=='OK'){
        document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
        $('#modal-confirm').modal('hide');
        $('#modal-success').modal('show');
        setTimeout(()=>$('#modal-success').modal('hide'), 2000);
      }
      confirm=false;
      selectId=null;
      mostrarClientes();
    }
  }else{
      document.getElementById('modal-confirm-msj').innerHTML=`Esta a punto de eliminar el registro con Id:${selectId}.`;
      $('#modal-confirm').modal('show');
  }
}

var limpiarModal = function(){
  document.getElementById('pNombreCliente').value='';
  document.getElementById('sNombreCliente').value='';
  document.getElementById('pApellidoCliente').value='';
  document.getElementById('sApellidoCliente').value='';
  document.getElementById('inputId').value='';
  document.getElementById('direccion').value='';
  document.getElementById('numTelCliente').value='';
  document.getElementById('nom_ciudad').value=-1;
  document.getElementById('inputEmail').value='';
  document.getElementById('errorMessage').style="display:none";
  document.getElementById('modal-titulo').innerHTML="Nuevo Cliente";
  modo=true;
}

mostrarClientes();
