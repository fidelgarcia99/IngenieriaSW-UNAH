renderTabla(null,null,"proveedores");

function guardarProveedor(){
	var datos = "nombreP="+$("#nombreP").val()+
				"&direccionP="+$("#direccionP").val()+
				"&telefonoP="+$("#telefonoP").val()+
				"&correoP="+$("#correoP").val();
	$.ajax({
		url: "php/api/proveedores.php",
		data: datos,
		method: "POST",
		dataType: "json",
		success:function(respuesta){
				$("#nombreP").val(" ");
				$("#direccionP").val(" ");
				$("#telefonoP").val(" ");
				$("#correoP").val(" ");

				$('#modal-success-message').html(respuesta.mensaje);
				$('#nuevoProveedorModal').modal('hide');
          		$('#modal-success-prov').modal('show');

          		renderTabla(null,null,"proveedores");
          		
           		setTimeout(function() {
					$('#modal-success-prov').modal('hide');
				},2000);
			},
		error:function(){
			alert("error");
		}
	});
}
