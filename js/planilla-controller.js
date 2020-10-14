// $(document).ready(function() {
// 	planilla();
// });

function planilla(){
	var datos = "codigo="+$("#fechas-planilla").val();
	$.ajax({
		url: "php/api/planilla.php?accion=3",
		data: datos,
		method: "POST",
		success:function(resultado){
			
				$(".tplanilla").html(resultado);
			},
		error:function(){
			alert("error");
		}
	});
}

function deducciones(idEmpleado, idPlanilla){
	var datos = "idEmpleado="+idEmpleado+
				"&idPlanilla="+idPlanilla;
	$.ajax({
		url: "php/api/planilla.php?accion=1",
		data: datos,
		method: "POST",
		success:function(resultado){
			
				$(".tdeducciones").html(resultado);
			},
		error:function(){
			alert("error");
		}
	});
}

function bonos(idEmpleado, idPlanilla){
var datos = "idEmpleado="+idEmpleado+
			"&idPlanilla="+idPlanilla;
	$.ajax({
		url: "php/api/planilla.php?accion=2",
		data: datos,
		method: "POST",
		success:function(resultado){
				
				$(".tbonos").html(resultado);
			},
		error:function(){
			alert("error");
		}
	});
}