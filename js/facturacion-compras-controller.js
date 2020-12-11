var carrito = Array();
var subtotal = 0;
var descuento = 0;
var total = 0;
var ivs = 0;

function formatearProductos(){
  let opciones = document.getElementById('select-productos');
  for (var i = 0; i < opciones.options.length; i++) {
    opciones.options[i].text = formatDescrip(opciones.options[i].text);
  }
}

function scan(event){
  if (window.event.keyCode==112) {
    window.event.preventDefault();
  }
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
      document.getElementById('input-descripcion').value = formatDescrip(element['Descripcion'],element['Tipo']);
      document.getElementById('input-paquetes').value=1;
      document.getElementById('input-unidades').value=1;
      document.getElementById('input-cantidad').value=1;
      document.getElementById('input-precio-compra').value=0;
      document.getElementById('input-precio-venta').value=element['Precio'];
      document.getElementById('input-descuento').value=0;
      validaCampos();
    });
  }).catch(err=>{
    console.error(err);
  });
}

function validaCampos(){
  let barcode = document.getElementById('input-codigo').value;
  let cantidad = document.getElementById('input-cantidad').value;
  let unidades = document.getElementById('input-unidades').value;
  let costo = document.getElementById('input-precio-compra').value;
  let descuento = document.getElementById('input-descuento').value;
  let precio = document.getElementById('input-precio-venta').value;
  let descripcion = document.getElementById('input-descripcion').value;

  if (barcode != '' && cantidad != '' && unidades != '' && parseInt(costo)>0 &&
      costo != '' && descripcion != '' && descuento != '' && precio != '')
  {
    document.getElementById('btn-agregar').disabled=false;
    return true;
  }
  document.getElementById('btn-agregar').disabled=true;
  return false;
}

function añadirProducto(){
  if (validaCampos())
  {
    let barcode = document.getElementById('input-codigo').value;
    let cantidad = parseInt(document.getElementById('input-cantidad').value);
    let unidades = parseInt(document.getElementById('input-unidades').value);
    let costo = Math.round((parseInt(document.getElementById('input-precio-compra').value) / unidades)*100)/100;
    let descuento = parseInt(document.getElementById('input-descuento').value);
    let precio = parseInt(document.getElementById('input-precio-venta').value);
    carrito.push({
      barcode:barcode,
      cantidad:cantidad,
      costo:costo,
      descuento:descuento,
      precio:precio,
      total:costo*cantidad - descuento
    });
    calcuarTotal();
    renderTabla();
    limpiarFormulario();
  }else{
    if (parseInt(costo)==0) {
    document.getElementById('div-error').innerHTML="Debe especificar el costo del producto.";
  }else{
    document.getElementById('div-error').innerHTML="Ingrese todos los campos primero";
  }
  document.getElementById('div-error').style='display:block';
  setTimeout(()=>{document.getElementById('div-error').style='display:none';}, 2000);
  }
}

function limpiarFormulario(){
  document.getElementById('input-codigo').value = '';
  document.getElementById('input-paquetes').value = '';
  document.getElementById('input-unidades').value = '';
  document.getElementById('input-cantidad').value = '';
  document.getElementById('input-precio-compra').value = '';
  document.getElementById('input-descuento').value = '';
  document.getElementById('input-precio-venta').value = '';
  document.getElementById('input-descripcion').value = '';
}

function eliminaProducto(barcode){
  carrito.forEach((item, i) => {
    if(item['Barcode']==barcode){
      carrito.splice(i,1);
    }
  });
  calcuarTotal();
  renderTabla();
}

function mouseOverRow(row){
  row.style="background-color:cornsilk;cursor:pointer";
}

function mouseOutRow(row){
  row.style="background-color:white;";
}

function addRow(element){
  let fila='';
  let boton=`<button class="btn btn-danger" onclick="eliminaProducto('${element['Barcode']}')" style="width:50px;"><i class="fas fa-trash"></i></button>`;
    fila+=`
        <td>${element['cantidad']}</td>
        <td>${element['barcode']}</td>
        <td>${document.getElementById('input-descripcion').value}</td>
        <td>${element['costo']}</td>
        <td>${element['precio']}</td>
        <td>${element['descuento']}</td>
        <td>${element['total']}</td>
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

function cambiarCantidad(){
  let paquetes = parseInt(document.getElementById('input-paquetes').value);
  let unidades = parseInt(document.getElementById('input-unidades').value);
  document.getElementById('input-cantidad').value=paquetes*unidades;
}

function limpiarFactura(){
  document.getElementById('nombreCliente').value='';
  document.getElementById('RTNCliente').value='';
  document.getElementById('input-codigo').value='';
  document.getElementById('input-total').value = '00.00';
  document.getElementById('input-descuento').value = '00.00';
  document.getElementById('input-ivs').value = '00.00';
  document.getElementById('input-subtotal').value = '00.00';
  total=0;
  descuento=0;
  subtotal=0;
  ivs = 0;
  carrito = [];
  renderTabla();
}

function calcuarTotal(){
  total=0;
  descuento=0;
  isv=0;
  subtotal=0;
  carrito.forEach((item, i) => {
    total+=item['total'];
    descuento+=item['descuento'];
  });
  isv =total - (total/1.15);
  subtotal = total - isv;

  document.getElementById('input-subtotal').value = Math.round(subtotal*100)/100;
  document.getElementById('input-ivs').value = Math.round(isv*100)/100;
  document.getElementById('input-descuento').value = descuento;
  document.getElementById('input-total').value = total;

}

function cambioPrecio(){
  document.getElementById('inputPrecioVenta').value=document.getElementById('select-productos').value;
}

siscan();
