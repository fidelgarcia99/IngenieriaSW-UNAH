var mostrarClientes = function(){
  renderTabla(null,null,'clientes');
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
      let respuesta = await nuevoRegistro(cliente, "clientes");

      if(respuesta!=null){
        if(respuesta.res=='OK'){
          document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
          $('#nuevoClienteModal').modal('hide');
          $('#modal-success').modal('show');
          setTimeout(()=>$('#modal-success').modal('hide'), 2000);
          pnombre.value='';
          snombre.value='';
          papellido.value='';
          sapellido.value='';
          id.value='';
          direccion.value='';
          telefono.value='';
          email.value='';
          mostrarClientes();
        }else{
          document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
          document.getElementById('errorMessage').style='display:block';
        }
      }
}
mostrarClientes();
