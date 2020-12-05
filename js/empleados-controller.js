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

var mostrarEmpleados = function(){
  tabla=document.getElementById('dataTable');
  renderTabla(null,null,'empleados',tabla);
}

var registraEmpleado = async function(){
  let pnombre = document.getElementById('inputPnombre').value;
  let snombre = document.getElementById('inputSnombre').value;
  let papellido = document.getElementById('inputPapellido').value;
  let sapellido = document.getElementById('inputSapellido').value;
  let identidad = document.getElementById('inputNumid').value;
  let direccion = document.getElementById('inputDireccion').value;
  let telefono = document.getElementById('inputNumtel').value;
  let ciudad = document.getElementById('nom_ciudad').value;
  let email = document.getElementById('inputEmail').value;
  let cargo = document.getElementById('selectCargo').value;

      let empleado = {
        id:id,
        pnombre : pnombre,
        snombre : snombre,
        papellido : papellido,
        sapellido : sapellido,
        identidad : identidad,
        direccion : direccion,
        telefono : telefono,
        ciudad : ciudad,
        email : email,
        cargo : cargo
      }
      let respuesta=null;
        if (modo) {
          respuesta = await nuevoRegistro(empleado, "empleados");
        }else{
          respuesta = await actualizaRegistro(empleado, "empleados");
          selectRow(id);
        }

      if(respuesta!=null){
        if(respuesta.res=='OK'){
          document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
          $('#nuevoEmpleadoModal').modal('hide');
          $('#modal-success').modal('show');
          setTimeout(()=>$('#modal-success').modal('hide'), 2000);
          document.getElementById('inputPnombre').value = '';
          document.getElementById('inputSnombre').value = '';
          document.getElementById('inputPapellido').value = '';
          document.getElementById('inputSapellido').value = '';
          document.getElementById('inputDireccion').value = '';
          document.getElementById('inputNumtel').value = '';
          document.getElementById('inputNumid').value = '';
          document.getElementById('inputEmail').value = '';
          mostrarEmpleados();
        }else{
          document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
          document.getElementById('errorMessage').style='display:block';
        }
      }
}

var editarRegistro = function(){
  let empleado = obtenerRegistros('id', id, 'empleados');
  empleado.then(data=>{
    if(data){
      data = data[0];
      document.getElementById('inputPnombre').value = data.pNombre;
      document.getElementById('inputSnombre').value = data.sNombre;
      document.getElementById('inputPapellido').value = data.pApellido;
      document.getElementById('inputSapellido').value = data.sApellido;
      document.getElementById('inputNumid').value = data.nId;
      document.getElementById('inputDireccion').value = data.Direccion;
      document.getElementById('inputNumtel').value = data.Telefono;
       //buscamos la opccion del select que coincide con la funcion
       let selectCiudades = document.getElementById('nom_ciudad');
       let ciudad = data.Ciudad;
         for(var i=1;i<selectCiudades.length;i++)
         {
           if(selectCiudades.options[i].value==ciudad)
           {
             // seleccionamos el valor que coincide
             selectCiudades.selectedIndex=i;
           }
         } 
      document.getElementById('inputEmail').value = data.Email;
      //buscamos la opccion del select que coincide con la funcion
      let selectCargos = document.getElementById('selectCargo');
      let funcion = data.Funcion;
        for(var i=1;i<selectCargos.length;i++)
        {
          if(selectCargos.options[i].value==funcion)
          {
            // seleccionamos el valor que coincide
            selectCargos.selectedIndex=i;
          }
        } 
      document.getElementById('modal-titulo').innerHTML = "Editar Empleado";
      modo = false
      $('#nuevoEmpleadoModal').modal('show');
    }else{
      console.error('El servidor no ha devuelto un resultado');
    }
  }).catch(error=>{
    console.error(error);
  });
}

mostrarEmpleados();
