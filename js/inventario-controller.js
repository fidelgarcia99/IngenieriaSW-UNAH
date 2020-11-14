renderTabla(null,null,"inventario");

const cambioCategoria = function(){
  var opcion = document.getElementById('select-categorias').options[document.getElementById('select-categorias').selectedIndex].text;
  switch (opcion) {
    case 'Llantas':
      document.getElementById('div-detalles').innerHTML=`
      <div class="form-label-group">
           <input type="number" pattern="[0-9]+" id="input-alto" class="form-control" placeholder="Altura" required>
      </div>
      <div class="form-label-group">
           <input type="number" pattern="[0-9]+" id="input-ancho" class="form-control" placeholder="Ancho" required>
      </div>
      <div class="form-label-group">
           <input type="number" pattern="[0-9]+" id="input-diametro" class="form-control" placeholder="Rin"required>
      </div>
      <div class="input-group mb-3">
            <select class="form-control" id="select-vehiculo">
              <option selected value="1">Carro</option>
              <option value="2">Moto</option>
            </select>
      </div>
      <br>
      <div class="input-group">
           <input type="text" id="input-observacion" class="form-control" placeholder="Observaciones" required>
      </div>
      `;
    break;
    case 'Aceites':
    break;
    case 'Lubricantes':
    break;
    case 'Consumible':
    break;
    case 'Neumaticos':
    break;
    case 'Accesorios':
    break;
  }
}

const categorias = function(){
  document.getElementById('select-categorias').innerHTML="<option value='-1'>--- Seleccione una categoria ---</option>"
  var data = obtenerRegistros("categorias",null,"inventario");
  data.then(result=>{
    result.forEach((item, i) => {
      document.getElementById('select-categorias').innerHTML+=`
      <option value="${i+1}">${item['descp_tipo']}</option>
      `;
    });
  }).catch(err=>{
    console.error(err);
  });
}

const contenedores = function(){
  document.getElementById('select-contenedor').innerHTML="<option value='-1'>--- Seleccione una ubicacion ---</option>"
  var data = obtenerRegistros("contenedores",null,"inventario");
  data.then(result=>{
    result.forEach((item, i) => {
      document.getElementById('select-contenedor').innerHTML+=`
      <option value="${i+1}">${item['Almacen']} ${item['Ubicacion']}</option>
      `;
    });
  }).catch(err=>{
    console.error(err);
  });
}

const marcas = function(){
  document.getElementById('select-marcas').innerHTML="<option value='-1'>--- Seleccione una marca ---</option>"
  var data = obtenerRegistros("marcas",null,"inventario");
  data.then(result=>{
    result.forEach((item, i) => {
      document.getElementById('select-marcas').innerHTML+=`
      <option value="${i+1}">${item['marca']}</option>
      `;
    });
  }).catch(err=>{
    console.error(err);
  });
}

categorias();
contenedores();
marcas();
renderTabla(null,null,"inventario");
