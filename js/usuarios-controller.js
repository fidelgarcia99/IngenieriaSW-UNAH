var mostrarUsuarios = function(){
  renderTabla(null,null,"usuarios");
}

var mostrarTiposUsuarios = function(){
  var dataa = obtenerRegistros('tipo',null,"usuarios");
 dataa.then((data)=>{
   var opciones = "";
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
   var opciones = "";
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
          username : username,
          idEmpleado : empleado,
          tipo: tipo,
          passwd : passwd
        }

        let respuesta = await nuevoRegistro(usuario, "usuarios");

        if(respuesta!=null){
          if(respuesta.res=='OK'){
            document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
            $('#nuevoUsuarioModal').modal('hide');
            $('#modal-success').modal('show');
            setTimeout(()=>$('#modal-success').modal('hide'), 2000);
            document.getElementById('inputUserame').value='';
            document.getElementById('inputPassword').value='';
            document.getElementById('inputConfirmPassword').value='';
            mostrarUsuarios();
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
    if(input.value=='')
    input.classList='form-control is-invalid';
    else
    input.classList='form-control';

    let username = document.getElementById('inputUserame');
    let passwd = document.getElementById('inputPassword');
    let cpasswd = document.getElementById('inputConfirmPassword');
    let errMes = document.getElementById('errorMessage');
    if(username.value!='' && passwd.value!='' && cpasswd.value!=''){
        errMes.style='display:none';
    }

}

var isCamposLlenos = function(){
  let username = document.getElementById('inputUserame');
  let passwd = document.getElementById('inputPassword');
  let cpasswd = document.getElementById('inputConfirmPassword');
  let errMes = document.getElementById('errorMessage');

    if(username.value=='' || passwd.value=='' || cpasswd.value=='' ){
        errMes.innerHTML = 'Ingrese todos los campos.';
        errMes.style='display:block';
        return false;
    }else{
        errMes.style='display:none';
        return true;
    }
}

var isCamposLlenos2 = function(){
  let username = document.getElementById('inputUserame');
  let passwd = document.getElementById('inputPassword');
  let cpasswd = document.getElementById('inputConfirmPassword');
  let errMes = document.getElementById('errorMessage');

    if(username.value!='' && passwd.value!='' && cpasswd.value!='' ){
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
mostrarUsuarios();
mostrarTiposUsuarios();
mostrarEmpleados();
