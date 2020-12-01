function deducciones(idEmpleado, idPlanilla){
	var datos = "idEmpleado="+idEmpleado+
				"&idPlanilla="+idPlanilla;
	$.ajax({
		url: "php/api/deducciones.php",
		data: datos,
		method: "GET",
		success:function(resultado){
			
				$(".tdeducciones").html(resultado);
			},
		error:function(){
			alert("error");
		}
	});
}

function guardarDeduccion(){
	var datos = "idEmpleado="+$("#dEmpleados").val()+
				"&inicio="+$("#dInicio").val()+
				"&fin="+$("#dFinal").val()+
				"&monto="+$("#dMonto").val()+
				"&tipo="+$("#dTipo").val();
	$.ajax({
		url: "php/api/deducciones.php",
		data: datos,
		method: "POST",
		dataType: 'json',
		success:function(respuesta){
			$('#modal-success-message').html(respuesta.mensaje);
			$('#nuevaDeduccionModal').modal('hide');
          	$('#modal-success').modal('show');
          	setTimeout(()=>$('#modal-success').modal('hide'), 2000);
			$("#dEmpleados").val("");
			$("#dInicio").val("");
			$("#dFinal").val("");
			$("#dMonto").val("");
			$("#dTipo").val("");
			planilla();
		},
		error:function(){
			alert("error");
		}
	});
}