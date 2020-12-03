function mouseOverRow(row){
  row.style="background-color:cornsilk;cursor:pointer";
}

function mouseOutRow(row){
  row.style="background-color:white;";
}

var mostrarEmpleados = function(){
  tabla=document.getElementById('dataTable');
  renderTabla(null,null,'empleados',tabla);
}

var registraEmpleado = async function(){
  let pnombre = document.getElementById('inputPnombre').value;
  let snombre = document.getElementById('inputSnombre').value;
  let papellido = document.getElementById('inputPapellido').value;
  let sapellido = document.getElementById('inputSapellido').value;
  let id = document.getElementById('inputNumid').value;
  let direccion = document.getElementById('inputDireccion').value;
  let telefono = document.getElementById('inputNumtel').value;
  let ciudad = document.getElementById('nom_ciudad').value;
  let email = document.getElementById('inputEmail').value;
  let cargo = document.getElementById('selectCargo').value;

      let empleado = {
        pnombre : pnombre,
        snombre : snombre,
        papellido : papellido,
        sapellido : sapellido,
        id : id,
        direccion : direccion,
        telefono : telefono,
        ciudad : ciudad,
        email : email,
        cargo : cargo
      }

      let respuesta = await nuevoRegistro(empleado, "empleados");

      if(respuesta!=null){
        if(respuesta.res=='OK'){
          document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
          $('#nuevoEmpleadoModal').modal('hide');
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
          mostrarEmpleados();
        }else{
          document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
          document.getElementById('errorMessage').style='display:block';
        }
      }
}
mostrarEmpleados();
