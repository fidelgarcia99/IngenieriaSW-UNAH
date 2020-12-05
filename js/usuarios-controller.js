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

var mostrarUsuarios = function(){
  tabla=document.getElementById('dataTable');
  renderTabla(null,null,"usuarios",tabla);
}

var editarRegistro = function(){
  let usuario = obtenerRegistros('id', id, 'usuarios');
  usuario.then(user=>{
    if(user!=null){
      data = user[0];
      document.getElementById('inputUserame').value = data.username;
      document.getElementById('selectIdEmpleado').value = data.empleado;
      document.getElementById('selectTipoUsuario').value = data.tipo;
      document.getElementById('inputPassword').value='';
      document.getElementById('inputConfirmPassword').value='';
      document.getElementById('modal-titulo').innerHTML = "Editar Usuario";
      modo = false
      $('#nuevoUsuarioModal').modal('show');
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
    let respuesta = await eliminarRegistroId(data,"usuarios");
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
      id=null;
      mostrarUsuarios();
    }
  }else{
      document.getElementById('modal-confirm-msj').innerHTML=`Esta a punto de eliminar el registro con Id:${id}.`;
      $('#modal-confirm').modal('show');
  }
}

var mostrarTiposUsuarios = function(){
  var dataa = obtenerRegistros("retorno","tipo","usuarios");
 dataa.then((data)=>{
   var opciones = "<option value='-1' selected disable>--- Seleccione un Tipo de Usuario ---</option>";
   data.forEach((item, i) => {
     opciones+=`
     <option value="${i+1}">${item['tipo']}</option>
     `;
   });
 document.getElementById('selectTipoUsuario').innerHTML=opciones;
 });
}

var mostrarEmpleados = function(){
  var dataa = obtenerRegistros(null,null,"empleados");
 dataa.then((data)=>{
   var opciones = "<option value='-1' selected disable>--- Seleccione un Empleado ---</option>";
   data.forEach((item, i) => {
     opciones+=`
     <option value="${i+1}">${item['Nombre']}</option>
     `;
   });
 document.getElementById('selectIdEmpleado').innerHTML=opciones;
 });
}

var registraUsuario = async function(){
  if(isCamposLlenos()){
    let username = document.getElementById('inputUserame').value;
    let empleado = document.getElementById('selectIdEmpleado').value;
    let tipo = document.getElementById('selectTipoUsuario').value;
    let passwd = document.getElementById('inputPassword').value;
    let cpasswd = document.getElementById('inputConfirmPassword').value;

    if(passwd == cpasswd){
        let usuario = {
          id:id,
          username : username,
          idEmpleado : empleado,
          tipo: tipo,
          passwd : passwd
        }
        let respuesta=null;
        if (modo) {
          respuesta = await nuevoRegistro(usuario, "usuarios");
        }else{
          respuesta = await actualizaRegistro(usuario, "usuarios");
        }
        if(respuesta!=null){
          if(respuesta.res=='OK'){
            document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
            $('#nuevoUsuarioModal').modal('hide');
            $('#modal-success').modal('show');
            setTimeout(()=>$('#modal-success').modal('hide'), 2000);
            mostrarUsuarios();
            limpiarModal();
          }else{
            document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
            document.getElementById('errorMessage').style='display:block';
          }
        }
    }else{
      document.getElementById('inputPassword').classList='form-control is-invalid';
      document.getElementById('inputConfirmPassword').classList='form-control is-invalid';
      document.getElementById('errorMessage').innerHTML='Las constraseñas no coinciden.';
      document.getElementById('errorMessage').style='display:block';
    }

  }

}

var teclea = function(input){
    input.classList='form-control';
}

var isCampoVacio = function(input){
    if(input.value=='' || input.value==-1)
    input.classList='form-control is-invalid';
    else
    input.classList='form-control';

    let username = document.getElementById('inputUserame');
    let passwd = document.getElementById('inputPassword');
    let cpasswd = document.getElementById('inputConfirmPassword');
    let errMes = document.getElementById('errorMessage');
    let empleado = document.getElementById('selectIdEmpleado');
    let tipo = document.getElementById('selectTipoUsuario');

    if(username.value!='' && passwd.value!='' && cpasswd.value!='' && empleado.value!=-1 && tipo.value!=-1){
        errMes.style='display:none';
    }

}

var isCamposLlenos = function(){
  let username = document.getElementById('inputUserame');
  let passwd = document.getElementById('inputPassword');
  let cpasswd = document.getElementById('inputConfirmPassword');
  let errMes = document.getElementById('errorMessage');
  let empleado = document.getElementById('selectIdEmpleado');
  let tipo = document.getElementById('selectTipoUsuario');

  if (modo) {
    if(username.value=='' || passwd.value=='' || cpasswd.value=='' || empleado.value==-1 || tipo.value==-1){
        errMes.innerHTML = 'Ingrese todos los campos.';
        errMes.style='display:block';
        return false;
    }else{
        errMes.style='display:none';
        return true;
    }
  }else{
    if(username.value=='' || empleado.value==-1 || tipo.value==-1){
        errMes.innerHTML = 'Ingrese todos los campos.';
        errMes.style='display:block';
        return false;
    }else{
        errMes.style='display:none';
        return true;
    }
  }
}

var isCamposLlenos2 = function(){
  let username = document.getElementById('inputUserame');
  let passwd = document.getElementById('inputPassword');
  let cpasswd = document.getElementById('inputConfirmPassword');
  let errMes = document.getElementById('errorMessage');
  let empleado = document.getElementById('selectIdEmpleado');
  let tipo = document.getElementById('selectTipoUsuario');

    if(username.value!='' && passwd.value!='' && cpasswd.value!='' && empleado.value!=-1 && tipo.value!=-1 ){
        errMes.style='display:none';
    }
}

var comparaContraseñas = function(){
  isCamposLlenos2();
  let passwd = document.getElementById('inputPassword');
  let cpasswd = document.getElementById('inputConfirmPassword');
  let err = document.getElementById('errorContras');
  if(cpasswd.value === passwd.value && cpasswd.value!='' && passwd.value!=''){
    passwd.classList='form-control';
    cpasswd.classList='form-control';
    err.style='display:none';
  }else if(cpasswd.value!='' && passwd.value!=''){
    passwd.classList='form-control is-invalid';
    cpasswd.classList='form-control is-invalid';
    err.style='display:block';
  }
}

var limpiarModal = function(){
  document.getElementById('inputUserame').value='';
  document.getElementById('selectIdEmpleado').value=-1;
  document.getElementById('selectTipoUsuario').value=-1;
  document.getElementById('inputPassword').value='';
  document.getElementById('inputConfirmPassword').value='';
  document.getElementById('errorMessage').style="display:none";
  document.getElementById('inputUserame').classList='form-control';
  document.getElementById('selectIdEmpleado').classList='form-control';
  document.getElementById('selectTipoUsuario').classList='form-control';
  document.getElementById('inputPassword').classList='form-control';
  document.getElementById('inputConfirmPassword').classList='form-control';
  document.getElementById('modal-titulo').innerHTML = "Nuevo Usuario";
  modo=true;
}

mostrarUsuarios();
mostrarTiposUsuarios();
mostrarEmpleados();
