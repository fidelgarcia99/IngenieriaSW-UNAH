function bonos(idEmpleado, idPlanilla){
    var datos = "idEmpleado="+idEmpleado+
                "&idPlanilla="+idPlanilla;
    $.ajax({
        url: "php/api/bonos.php",
        data: datos,
        method: "GET",
        success:function(resultado){
                
                $(".tbonos").html(resultado);
            },
        error:function(){
            alert("error");
        }
    });
}

function guardarBono(){
	var datos = "idEmpleado="+$("#bEmpleados").val()+
				"&desc="+$("#bDescripcion").val()+
                "&fecha="+$("#bFecha").val()+
                "&monto="+$("#bMonto").val();
	$.ajax({
		url: "php/api/bonos.php",
		data: datos,
        method: "POST",
        dataType: 'json',
		success:function(respuesta){
			$('#modal-success-message').html(respuesta.mensaje);
			$('#nuevoBonoModal').modal('hide');
          	$('#modal-success').modal('show');
          	setTimeout(()=>$('#modal-success').modal('hide'), 2000);
			$("#bEmpleados").val("");
			$("#bDescripcion").val("");
			$("#dFecha").val("");
			$("#bMonto").val("");
			planilla();
		},
		error:function(){
			alert("error");
		}
	});
}