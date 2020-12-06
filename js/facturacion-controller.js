var carrito = Array();

function scan(event){
  if (event.keyCode >47 && event.keyCode<58) {
    document.getElementById('input-codigo').value+=event.key;
  }else{
    enter(event);
  }
}

function enter(event){
  if(event.keyCode == 13){
    let code = document.getElementById('input-codigo');
    buscaProducto(code.value);
    code.value='';
  }
}

function noscan(){
  document.getElementById('page-top').removeEventListener("keypress",scan);
}

function siscan(){
  document.getElementById('page-top').addEventListener("keypress",scan);
}

function buscaProducto(barcode){
  let producto = obtenerRegistros("barcode",barcode,"inventario");
  producto.then(data=>{
    data.forEach(element => {
      element['Cantidad']=1;
      element['Precio'] = parseFloat(element['Precio']);
      element['Descuento'] = parseFloat(element['Descuento']);
      element['Descripcion']=formatDescrip(element['Descripcion'],element['Tipo']);

      if (carrito.length>0) {
        let alreadyExist = false;
        carrito.forEach((item, i) => {
          if(item['Barcode']==element['Barcode']){
            item['Cantidad']++;
            alreadyExist = true;
          }
        });
        if (!alreadyExist) {
          carrito.push(element);
        }
      }else{
        carrito.push(element);
      }
    });
    renderTabla();
  }).catch(err=>{
    console.error(err);
  });
}

function eliminaProducto(barcode){
  carrito.forEach((item, i) => {
    if(item['Barcode']==barcode){
      carrito.splice(i,1);
    }
  });
  renderTabla();
}

function cargarClientes(){
  document.getElementById('nom_cliente').innerHTML='';
  clientes = new Array();
  obtenerRegistros(null,null,"empresasclientes")
  .then(data=>{
    data.forEach((item, i) => {
      clientes.push(item);
      document.getElementById('nom_cliente').innerHTML+=`
        <option value="${item['idEmpresaCliente']}">${item['nombreEmpresa']}</option>
      `;
    });
    cambioRtn();
  }).catch(err=>{
    console.error(err);
  });;
}

async function guardarCliente(){
  if (document.getElementById('RTNCliente').value!='' &&
      document.getElementById('nombreCliente')!='' &&
      document.getElementById('nombreCliente')!='Consumidor Final'
    ) {
    let nuevoCliente = {
      nombre:document.getElementById('nombreCliente').value,
      RTN:document.getElementById('RTNCliente').value
    };

    let respuesta=null;
    respuesta = await nuevoRegistro(nuevoCliente, "empresasclientes");

    if(respuesta!=null){
      if(respuesta.res=='OK'){
        document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
        $('#modal-success').modal('show');
        setTimeout(()=>$('#modal-success').modal('hide'), 2000);
      }else{
        document.getElementById('errorMessage').innerHTML=respuesta.mensaje;
        document.getElementById('errorMessage').style='display:block';
        setTimeout(()=>{document.getElementById('errorMessage').style='display:none';}, 2000);
      }
    }
  }
}

function cambioRtn(){
    document.getElementById('inputId').value=clientes[document.getElementById('nom_cliente').selectedIndex]['RTN'];
}

function escogeCliente(){
  document.getElementById('nombreCliente').value = document.getElementById('nom_cliente').options[document.getElementById('nom_cliente').selectedIndex].text;
  document.getElementById('RTNCliente').value = document.getElementById('inputId').value;
}

function mouseOverRow(row){
  row.style="background-color:cornsilk;cursor:pointer";
}

function mouseOutRow(row){
  row.style="background-color:white;";
}

function addRow(element){
  let fila=`<td><input type="number" class="form-control" min="1" value="${element['Cantidad']}" onchange="cambiarCantidad(${element['Barcode']},this)" style="width:80px;"></td>`;
  let boton=`<button class="btn btn-danger" onclick="eliminaProducto(${element['Barcode']})" style="width:50px;"><i class="fas fa-trash"></i></button>`;
    fila+=`
        <td>${element['Barcode']}</td>
        <td>${element['Descripcion']}</td>
        <td>${element['Precio']}</td>
        <td>${element['Descuento']}</td>
        <td>${element['Precio'] * element['Cantidad']}</td>
        <td>${boton}</td>
    `;
  tbody.innerHTML+=`
  <tr onmouseover="mouseOverRow(this)" onmouseout="mouseOutRow(this)">${fila}</tr>
  `;
}

function renderTabla(){
tbody.innerHTML='';
  carrito.forEach((item, i) => {
    addRow(item);
  });
}

function cambiarCantidad(barcode, input){
  carrito.forEach((item, i) => {
    if(item['Barcode']==barcode){
      item['Cantidad'] = parseInt(input.value);
    }
  });
  renderTabla();
}

siscan();
