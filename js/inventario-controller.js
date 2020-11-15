renderTabla(null,null,"inventario");

const cambioCategoria = function(){
  var opcion = document.getElementById('select-categorias').options[document.getElementById('select-categorias').selectedIndex].text;
  switch (opcion) {
    case 'Llantas':
      document.getElementById('div-detalles').innerHTML=`
      <div class="form-label-group tercio">
      Altura
           <input type="number" pattern="[0-9]+" id="input-alto" class="form-control" placeholder="Altura" required>
      </div>
      <div class="form-label-group tercio">
      Ancho
           <input type="number" pattern="[0-9]+" id="input-ancho" class="form-control" placeholder="Ancho" required>
      </div>
      <div class="form-label-group tercio">
      Diametro
           <input type="number" pattern="[0-9]+" id="input-diametro" class="form-control" placeholder="Rin"required>
      </div>
      <div class="form-label-group">
      Tipo Vehiculo
        <div class="input-group">
              <select class="form-control" id="select-vehiculo">
                <option selected value="carro">Carro</option>
                <option value="moto">Moto</option>
              </select>
        </div>
      </div>
      <div class="form-label-group">
      Observaciones
           <input type="text" id="input-observacion" class="form-control" placeholder="Observaciones" required>
      </div>
      `;
    break;
    case 'Aceites':
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group">
    Tipo de Aceite
      <div class="input-group">
            <select class="form-control" id="select-tipo-aceite">
              <option selected value="sintetico">Sintetico</option>
              <option value="semi-sintetico">Semi-sintetico</option>
              <option value="mineral">Mineral</option>
            </select>
      </div>
    </div>
    <div class="form-label-group">
    Viscosidad SAE
      <div class="input-group">
            <select class="form-control" id="select-tipo-aceite">
              <option selected value="25W">25W</option>
              <option selected value="20W">20W</option>
              <option selected value="15W">15W</option>
              <option selected value="10W">10W</option>
              <option selected value="5W">5W</option>
              <option selected value="0W">0W</option>
            </select>
            <select class="form-control" id="select-tipo-aceite">
              <option selected value="50">50</option>
              <option selected value="40">40</option>
              <option selected value="30">30</option>
              <option selected value="20">20</option>
            </select>
      </div>
    </div>
    <div class="form-label-group">
    Servicio API
      <div class="input-group">
            <select class="form-control" id="select-tipo-aceite">
              <option selected value="SN">Motor a Gasolina (SN)</option>
              <option selected value="SM">Motor a Gasolina (SM)</option>
              <option selected value="SL">Motor a Gasolina (SL)</option>
              <option selected value="CJ">Motor a Diesel (CJ)</option>
              <option selected value="CI">Motor a Diesel (CI)</option>
              <option selected value="CH">Motor a Diesel (CH)</option>
            </select>
      </div>
    </div>
    <div class="form-label-group">
    Tipo Vehiculo
      <div class="input-group">
            <select class="form-control" id="select-vehiculo">
              <option selected value="4">Carro</option>
              <option value="4">Moto 4T</option>
              <option value="2">Moto 2T</option>
            </select>
      </div>
    </div>
    <div class="form-label-group">
    Observaciones
         <input type="text" id="input-observacion" class="form-control" placeholder="Observaciones" required>
    </div>
    `;
    break;
    case 'Lubricantes':
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group">
    Nombre
         <input type="text" id="input-nombre-lubricante" class="form-control" placeholder="Nombre del lubricante" required>
    </div>
    <div class="form-label-group">
    Grado de Viscosidad
         <input type="text" id="input-grado-viscosidad" class="form-control" placeholder="Grado de viscosidad" required>
    </div>
    <div class="form-label-group">
    Observaciones
         <input type="text" id="input-observacion" class="form-control" placeholder="Observaciones" required>
    </div>
    `;
    break;
    case 'Consumibles':
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group">
    Nombre
         <input type="text" id="input-nombre-lubricante" class="form-control" placeholder="Nombre del Producto" required>
    </div>
    <div class="form-label-group">
    Fecha de vencimiento
         <input type="date" id="input-fecha-vencimiento" class="form-control" placeholder="Fecha de vencimiento" required>
    </div>
    <div class="form-label-group">
    Observaciones
         <input type="text" id="input-observacion" class="form-control" placeholder="Observaciones" required>
    </div>
    `;
    break;
    case 'Neumaticos':
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group">
    Diametro
         <input type="number" pattern="[0-9]+" id="input-diametro" class="form-control" placeholder="Rin"required>
    </div>
    <div class="form-label-group">
    Tipo Valvula
      <div class="input-group">
            <select class="form-control" id="select-vehiculo">
              <option selected value="corta">Corta</option>
              <option value="larga">Larga</option>
            </select>
      </div>
    </div>
    <div class="form-label-group">
    Tipo Vehiculo
      <div class="input-group">
            <select class="form-control" id="select-vehiculo">
              <option selected value="carro">Carro</option>
              <option value="moto">Moto</option>
            </select>
      </div>
    </div>
    <div class="form-label-group">
    Observaciones
         <input type="text" id="input-observacion" class="form-control" placeholder="Observaciones" required>
    </div>
    `;
    break;
    case 'Accesorios':
    document.getElementById('div-detalles').innerHTML=`
    <div class="form-label-group">
    Descripcion
         <input type="text" id="input-grado-descripcion" class="form-control" placeholder="Descripcion" required>
    </div>
    `;
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
