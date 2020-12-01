var selectId=null;
confirm=false;

const formatDescrip = function(desc,tipo){
  desc = JSON.parse(desc);
  let resp='';

  switch (tipo) {
    case 'Llantas':
    resp = `${desc['altura']}/${desc['ancho']}/${desc['tipo']}${desc['diametro']} para ${desc['vehiculo']} ${desc['observacion']}`;
    break;
    case 'Aceites':
    resp=`${desc['base']} SAE ${desc['saelow']}${desc['saehigh']} API ${desc['apiservice']}-${desc['tiempos']} ${desc['volumen']}${desc['unidad']}`;
    break;
    case 'Lubricantes':
    resp=`${desc['tipo']} ${desc['viscosidad']} ${desc['volumen']}${desc['unidad']}`;
    break;
    case 'Consumibles':
    resp=`${desc['nombre']} Vence: ${desc['caducidad']}`;
    break;
    case 'Neumaticos':
    let t ='';
    resp=`R${desc['diametro']} valvula ${desc['valvula']} para ${desc['vehiculo']} ${desc['observacion']}`;
    break;
    case 'Accesorios':
    resp="Accesorios";
    resp=`${desc['general']}`;
    break;
  }
  return resp;
}

const mostrarInventario = function(){
  var dataa = obtenerRegistros(null,null,"inventario");
  dataa.then((data)=>{
    if (data!=null) {
      document.getElementById('tbody').innerHTML='';
      document.getElementById('thead').innerHTML='';
      //Se agrega el nombre de las columnas
      let nombreCol = '';
      for(let i in data[0]){
          nombreCol+=`
              <td>${i}</td>
          `;
      }

      nombreCol+=`<td></td>`;

      document.getElementById('thead').innerHTML+=`
      <tr>${nombreCol}</tr>
      `;

      //Se gregan las filas de datos
      data.forEach(element => {
          let fila='';
          for(let i in element){
              if(element[i]==null){
                  fila+=`
                      <td>---</td>
                  `;
              }else{
                  if(i=="Descripcion"){
                    element[i]=formatDescrip(element[i],element['Tipo']);
                  }
                  fila+=`
                      <td>${element[i]}</td>
                  `;
              }
          }

            fila+=`<td>
            <div class="container-fluid px-0" style="max-widh:450%;">
              <div class="row">
                <div class="col pr-0 mr-0">
                  <button class="btn text-info p-1" onclick="editarRegistro(${element['Id']});"><i class="fa fa-edit"></i></button>
                </div>
                <div class="col pl-0 ml-0">
                  <button class="btn text-danger p-1" onclick="eliminarRegistro(${element['Id']});"><i class="fa fa-trash"></i></button>
                </div>
              </div>
            </div>
            </td>`;

          document.getElementById('tbody').innerHTML+=`
          <tr">${fila}</tr>
          `;
      });
      $('#dataTable').DataTable();
    }
  });
}

const cambioCategoria = function(){
  var opcion = document.getElementById('select-categorias').options[document.getElementById('select-categorias').selectedIndex].text;
  switch (opcion) {
    case 'Llantas':
    let alturas ='';
    let anchos ='';
    let radios='';
    for (var i = 125; i <= 335; i+=10) {
      anchos+=`<option value="${i}">${i}</option>`;
    }
    for (var i = 25; i <= 80; i+=5) {
      alturas+=`<option value="${i}">${i}</option>`;
    }
    for (var i = 10; i <= 21; i++) {
      radios+=`<option value="${i}">${i}</option>`;
    }
      document.getElementById('div-detalles').innerHTML=`
      <div class="form-label-group cuarto">
      Ancho
      <div class="input-group espaciado">
            <select class="form-control" id="select-ancho">
              ${anchos}
            </select>
      </div>
      </div>
      <div class="form-label-group cuarto">
      Altura
      <div class="input-group espaciado">
            <select class="form-control" id="select-alto">
              ${alturas}
            </select>
      </div>
      </div>
      <div class="form-label-group cuarto">
      Tipo
      <div class="input-group espaciado">
            <select class="form-control" id="select-tipo">
              <option value="R">R</option>
              <option value="ZR">ZR</option>
              <option value="RF">RF</option>
              <option value="D">D</option>
            </select>
      </div>
      </div>
      <div class="form-label-group cuarto">
      Diametro
      <div class="input-group espaciado">
            <select class="form-control" id="select-diametro">
              ${radios}
            </select>
      </div>
      </div>
      <div class="form-label-group medio">
      Tipo Vehiculo
        <div class="input-group espaciado">
              <select class="form-control" id="select-vehiculo">
                <option selected value="carro">Carro</option>
                <option value="moto">Moto</option>
              </select>
        </div>
      </div>
      <div class="form-label-group medio">
      Estado
      <div class="input-group espaciado">
            <select class="form-control" id="select-estado">
              <option value="nueva">Nueva</option>
              <option value="usada">Usada</option>
            </select>
      </div>
      </div>
      `;
    break;
    case 'Aceites':
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group medio">
    Tipo de Aceite
      <div class="input-group espaciado">
            <select class="form-control" id="select-tipo-aceite">
              <option selected value="Sintetico">Sintetico</option>
              <option value="Semi-sintetico">Semi-sintetico</option>
              <option value="Mineral">Mineral</option>
            </select>
      </div>
    </div>
    <div class="form-label-group medio">
    Tipo Vehiculo
      <div class="input-group espaciado">
            <select class="form-control" id="select-tiempos-vehiculo">
              <option selected value="4">Carro</option>
              <option value="4">Moto 4T</option>
              <option value="2">Moto 2T</option>
            </select>
      </div>
    </div>
    <div class="form-label-group tercio">
    Viscosidad SAE
      <div class="input-group">
            <select class="form-control" id="select-sae-low">
              <option selected value="25W">25W</option>
              <option selected value="20W">20W</option>
              <option selected value="15W">15W</option>
              <option selected value="10W">10W</option>
              <option selected value="5W">5W</option>
              <option selected value="0W">0W</option>
            </select>
            <select class="form-control" id="select-sae-high">
              <option selected value="50">50</option>
              <option selected value="40">40</option>
              <option selected value="30">30</option>
              <option selected value="20">20</option>
            </select>
      </div>
    </div>
    <div class="form-label-group tercio mx-auto">
    Servicio API
      <div class="input-group">
            <select class="form-control" id="select-api-service">
              <option selected value="SN">Motor a Gasolina (SN)</option>
              <option selected value="SM">Motor a Gasolina (SM)</option>
              <option selected value="SL">Motor a Gasolina (SL)</option>
              <option selected value="CJ">Motor a Diesel (CJ)</option>
              <option selected value="CI">Motor a Diesel (CI)</option>
              <option selected value="CH">Motor a Diesel (CH)</option>
            </select>
      </div>
    </div>

    <div class="form-label-group cuarto">
    Volumen
    <div class="input-group">
          <input type="number" id="input-volumen" class="form-control tercio" value="1">
          <select class="form-control dosterios" id="select-volumen">
            <option selected value="G">Galones</option>
            <option selected value="L">Litros</option>
          </select>
    </div>
    </div>
    `;
    break;
    case 'Lubricantes':
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group tercio">
    Tipo Lubricante
    <div class="input-group espaciado">
          <select class="form-control" id="select-tipo-lubricante">
            <option selected value="Liquido Hidraulico">Liquido Hidraulico</option>
            <option value="Liquido de Frenos">Liquido de Frenos</option>
            <option value="Liquido para Transmicion">Liquido para Transmicion</option>
            <option value="Grasa">Grasa</option>
          </select>
    </div>
    </div>
    <div class="form-label-group tercio">
    Grado de Viscosidad
         <input type="text" id="input-grado-viscosidad" class="form-control espaciado" placeholder="Grado de viscosidad" required>
    </div>
    <div class="form-label-group tercio">
    Volumen/Cantidad
    <div class="input-group">
          <input type="number" id="input-volumen" class="form-control tercio" value="1">
          <select class="form-control dosterios" id="select-volumen">
            <option selected value="G">Galones</option>
            <option selected value="L">Litros</option>
            <option selected value="gr">Gramos</option>
          </select>
    </div>
    </div>
    `;
    break;
    case 'Consumibles':
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group medio ">
    Nombre
         <input type="text" id="input-nombre-consumible" class="form-control espaciado" placeholder="Nombre del Producto" required>
    </div>
    <div class="form-label-group medio">
    Fecha de vencimiento
         <input type="date" id="input-fecha-vencimiento" class="form-control espaciado" placeholder="Fecha de vencimiento" required>
    </div>
    `;
    break;
    case 'Neumaticos':
    let diametros='';
    for (var i = 10; i <= 21; i++) {
      diametros+=`<option value="${i}">${i}</option>`;
    }
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group cuarto">
    Diametro
    <div class="input-group espaciado">
          <select class="form-control" id="select-diametro">
            ${diametros}
          </select>
    </div>
    </div>
    <div class="form-label-group cuarto">
    Tipo Valvula
      <div class="input-group espaciado">
            <select class="form-control" id="select-valvula">
              <option selected value="corta">Corta</option>
              <option value="larga">Larga</option>
            </select>
      </div>
    </div>
    <div class="form-label-group cuarto">
    Tipo Vehiculo
      <div class="input-group espaciado">
            <select class="form-control" id="select-vehiculo">
              <option selected value="carro">Carro</option>
              <option value="moto">Moto</option>
            </select>
      </div>
    </div>
    <div class="form-label-group cuarto">
    Observacion (Moto)
    <div class="input-group espaciado">
          <select class="form-control" id="select-observacion">
            <option selected value="trasero">Trasera</option>
            <option value="delantero">Delantera</option>
          </select>
    </div>
    </div>
    `;
    break;
    case 'Accesorios':
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group">
    Descripcion
         <input type="text" id="input-descripcion" class="form-control" placeholder="Descripcion" required>
    </div>
    `;
    break;
  }
}

const registraProducto = async function(){
  var opcion = document.getElementById('select-categorias').options[document.getElementById('select-categorias').selectedIndex].text;

    var detalles = null;
    switch (opcion) {
      case 'Llantas':
        detalles={
          altura:document.getElementById('select-alto').value,
          ancho:document.getElementById('select-ancho').value,
          tipo:document.getElementById('select-tipo').value,
          diametro:document.getElementById('select-diametro').value,
          vehiculo:document.getElementById('select-vehiculo').value,
          observacion:document.getElementById('select-estado').value
        };
      break;
      case 'Aceites':
        detalles={
        base:document.getElementById('select-tipo-aceite').value,
        saelow:document.getElementById('select-sae-low').value,
        saehigh:document.getElementById('select-sae-high').value,
        apiservice:document.getElementById('select-api-service').value,
        tiempos:document.getElementById('select-tiempos-vehiculo').value,
        volumen:document.getElementById('input-volumen').value,
        unidad:document.getElementById('select-volumen').value
      };
      break;
      case 'Lubricantes':
      detalles={
        tipo:document.getElementById('select-tipo-lubricante').value,
        viscosidad:document.getElementById('input-grado-viscosidad').value,
        volumen:document.getElementById('input-volumen').value,
        unidad:document.getElementById('select-volumen').value,
      };
      break;
      case 'Consumibles':
      detalles={
        nombre:document.getElementById('input-nombre-consumible').value,
        caducidad:document.getElementById('input-fecha-vencimiento').value,
      };
      break;
      case 'Neumaticos':
      detalles={
        diametro:document.getElementById('select-diametro').value,
        valvula:document.getElementById('select-valvula').value,
        vehiculo:document.getElementById('select-vehiculo').value,
        observacion:document.getElementById('select-observacion').value,
      };
      break;
      case 'Accesorios':
      detalles={general:document.getElementById('input-descripcion').value};
      break;
    }
    if (detalles!="") {
      detalles=JSON.stringify(detalles)
    }
    var producto={
      descripcion:detalles,
      barcode:document.getElementById('input-barcode').value,
      marca:document.getElementById('select-marcas').value,
      contenedor:document.getElementById('select-contenedor').value,
      categoria:document.getElementById('select-categorias').value
    }

    let respuesta=null;
    //if (modo) {
      respuesta = await nuevoRegistro(producto, "inventario");
    //}else{
    //  respuesta = await actualizaRegistro(cliente, "clientes");
    //}
    if(respuesta!=null){
      if(respuesta.res=='OK'){
        document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
        $('#nuevoProductoModal').modal('hide');
        $('#modal-success').modal('show');
        setTimeout(()=>$('#modal-success').modal('hide'), 2000);
        mostrarInventario();
        if(document.getElementById('select-categorias').options[document.getElementById('select-categorias').selectedIndex].text=="Accesorios"){
          document.getElementsByClassName('input-descripcion').value='';
        }
      }else{
        document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
        document.getElementById('errorMessage').style='display:block';
      }
    }else{
      console.console.error('El servidor no ha devuelto respuesta');
    }
}

const eliminarRegistro = async function(id){
  if (confirm) {
    let data = {id:id}
    let respuesta = await eliminarRegistroId(data,"inventario")
    if(respuesta!=null){
      if(respuesta.res=='OK'){
        document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
        $('#modal-confirm').modal('hide');
        $('#modal-success').modal('show');
        setTimeout(()=>$('#modal-success').modal('hide'), 2000);
      }
      selectId=null;
      confirm=false;
      mostrarInventario();
    }
  }else{
      document.getElementById('modal-confirm-msj').innerHTML=`Esta a punto de eliminar el registro con Id:${id}.`;
      $('#modal-confirm').modal('show');
      selectId = id;
  }
}

mostrarInventario();
cambioCategoria();
