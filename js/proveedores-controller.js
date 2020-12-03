var mostrarProveedores = function(){
  tabla=document.getElementById('dataTable');
  renderTabla(null,null,'proveedores',tabla);
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
}
mostrarProveedores();
