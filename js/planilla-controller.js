function deducciones(codigo){
	var datos = "codigo="+codigo;
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

function bonos(codigo){
var datos = "codigo="+codigo;
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