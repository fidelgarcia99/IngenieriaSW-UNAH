var confirm = false;

$(document).ready(function() {
	selectFechas();
});

function selectFechas(){

	$.ajax({
		url: "php/api/planilla.php",
		method: "SEL",
		success:function(res){
			$("#fechas-planilla").html(res);
			planilla();
		},
		error:function(){
			alert("error");
		}
	});
}

function planilla(){
	var idPlanilla = $("#fechas-planilla").val();
	$("#dataTablePlanilla").DataTable({
		"destroy":true,
		"ajax":{
			"method":"GET",
			"url":"php/api/planilla.php",
			"data": {"codigo": idPlanilla}
		},
		"columns":[
			{"data":"pnombre"},
			{"data":"papellido"},
			{"data":"nombre_cargo"},
			{"data":"fecha_nombramiento"},
			{"data":"idEmpleado",
				"render": function ( data, type, row ) {
				return '<div class="text-center"><button type="button" onclick="deducciones('+data+', '+idPlanilla+')" class="btn btn-primary" data-toggle="modal" data-target="#deducciones">Deducciones</button></div>';}
			},
			{"data":"idEmpleado",
				"render": function ( data, type, row ) {
				return '<div class="text-center"><button type="button" onclick="bonos('+data+', '+idPlanilla+')" class="btn btn-primary" data-toggle="modal" data-target="#bonos">Bonos</button></div>';}
			
			},
			{"data":"sueldo_emp"},
			{"data":"sueldo_total"},
			{"data":"estado_planilla"}
		]
	});
	estado();
}

function estado(){
	$.ajax({
		url: "php/api/estado.php",
		method: "GET",
		dataType: 'json',
		success:function(resultado){
			if(resultado.existe==1){
				$("#addPlanilla").addClass('disabled');
				$("#addDeduccion").removeClass('disabled');
				$("#addBono").removeClass('disabled');
				$("#pagarPlanilla").prop('disabled', false);
			}else{
				$("#addPlanilla").removeClass('disabled');
				$("#addDeduccion").addClass('disabled');
				$("#addBono").addClass('disabled');
				$("#pagarPlanilla").prop('disabled', true);
			}
		},
		error:function(){
			alert("error");
		}
	});
}

function actualizarEstado(estado){
	if(confirm){
		let datos = {estado:estado}
		$.ajax({
			url: "php/api/planilla.php",
			data: JSON.stringify(datos),
			method: "PUT",
			success:function(){
				$('#modal-confirm-pagar-planilla').modal('hide');
				planilla();
			},
			error:function(){
				console.error('El Servidor no ha devuelto nada.');
			}
		});
		confirm=false;
	}else{
		document.getElementById('modal-confirm-pagar-planilla-msj').innerHTML=`Esta seguro que desea pagar la planilla actual?`;
		$('#modal-confirm-pagar-planilla').modal('show');
	}
}
  

function guardarPlanilla(){
	var datos = "efectiva="+$("#efectiva").val()+
				"&inicio="+$("#inicio").val()+
				"&fin="+$("#final").val();
	$.ajax({
		url: "php/api/planilla.php",
		data: datos,
		method: "POST",
		dataType: 'json',
		success:function(respuesta){
			$('#modal-success-message').html(respuesta.mensaje);
			$('#nuevaPlanillaModal').modal('hide');
          	$('#modal-success').modal('show');
          	setTimeout(()=>$('#modal-success').modal('hide'), 2000);
			$("#efectiva").val("");
			$("#inicio").val("");
			$("#final").val("");
			selectFechas();
			planilla();
		},
		error:function(){
			alert("error");
		}
	});
}