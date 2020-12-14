var carrito = Array();
var subtotal = 0;
var descuento = 0;
var total = 0;
var isv = 0;

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
      element['Id'] = parseInt(element['Id']);
      element['Total']=0;
      element['ISV']=0;

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
      calcuarTotal();
    });
    renderTabla();
    validaCampos();
  }).catch(err=>{
    console.error(err);
  });
}

async function registrarVenta(){
  let numFactura = document.getElementById('input-numero-factura').value;
  let cliente = document.getElementById('input-cliente').value;
  let rtn = document.getElementById('input-rtn').value;

if (validaCampos()) {

        let venta = {
          numFactura : numFactura,
          cliente:cliente,
          rtn:rtn,
          subtotal:subtotal,
          isv:isv,
          descuento : descuento,
          total : total,
          carrito:carrito
        }
        
          let respuesta= await nuevoRegistro(venta, "ventas");

        if(respuesta!=null){
          if(respuesta.res=='OK'){
            document.getElementById('modal-success-message').innerHTML = respuesta.mensaje;
            $('#nueva-compra-modal').modal('hide');
            $('#modal-success').modal('show');
            setTimeout(()=>$('#modal-success').modal('hide'), 2000);
            limpiarFactura();
          }else{
            document.getElementById('div-error').innerHTML=respuesta.mensaje;
            document.getElementById('div-error').style='display:block';
            setTimeout(()=>{document.getElementById('div-error').style='display:none';}, 4000);
          }
        }
}else{
  document.getElementById('div-error').innerHTML=respuesta.mensaje;
  document.getElementById('div-error').style='display:block';
  setTimeout(()=>{document.getElementById('div-error').style='display:none';}, 4000);
}
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
        document.getElementById('div-error').innerHTML=respuesta.mensaje;
        document.getElementById('div-error').style='display:block';
        setTimeout(()=>{document.getElementById('div-error').style='display:none';}, 2000);
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
  let fila=`<td><input type="number" class="form-control" min="1" value="${element['Cantidad']}" onchange="cambiarCantidad('${element['Barcode']}',this)" onfocusin="noscan()" onfocusout="siscan()"  style="width:80px;"></td>`;
  let boton=`<button class="btn btn-danger" onclick="eliminaProducto('${element['Barcode']}')" style="width:50px;"><i class="fas fa-trash"></i></button>`;
    fila+=`
        <td>${element['Barcode']}</td>
        <td>${element['Descripcion']}</td>
        <td>${element['Precio']}</td>
        <td>${element['Descuento']}</td>
        <td>${element['Total']}</td>
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
  calcuarTotal();
  renderTabla();
}

function onfocusInNombre(object){
  noscan();
  if (object.value=="Consumidor Final") {
    object.value="";
  }
}

function onfocusOutNombre(object){
  siscan();
  if (object.value=='') {
    object.value="Consumidor Final";
  }
}

function adelantoEmpleado(){
  if (carrito.length>0) {
    carrito.forEach((item, i) => {
      data = {
        idEmpleado:document.getElementById('RTNCliente').value,
        idProducto:parseInt(item['Id']),
        monto:item['Total'],
        cantidad:item['Cantidad'],
        producto:item['Descripcion']
      };

      let respuesta=actualizaRegistro(data,"deducciones");

      respuesta.then(res=>{
        if(res!=null){
          if(res.res=='OK'){
            document.getElementById('modal-success-message').innerHTML = res.mensaje;
            $('#modal-success').modal('show');
            setTimeout(()=>$('#modal-success').modal('hide'), 2000);
          }else if(res.res=='fail'){
            document.getElementById('div-error').innerHTML = res.mensaje;
            document.getElementById('div-error').style="display:block";
            setTimeout(()=>{document.getElementById('div-error').style="display:none"; }, 6000);
          }
        }else{
          console.error('El servidor no ha devuelto nada.');
        }
      }).catch(err=>{
        console.error(error);
      });
    });
    limpiarFactura();
  }else{
    document.getElementById('div-error').innerHTML = "Debe ingresar por lo menos un producto";
    document.getElementById('div-error').style="display:block";
    setTimeout(()=>{document.getElementById('div-error').style="display:none"; }, 2000);
  }
}

function limpiarFactura(){
  document.getElementById('input-numero-factura').value='';
  document.getElementById('input-cliente').value='Consumidor Final';
  document.getElementById('input-rtn').value='';
  document.getElementById('input-codigo').value='';
  document.getElementById('input-total').value = '00.00';
  document.getElementById('input-descuento').value = '00.00';
  document.getElementById('input-ivs').value = '00.00';
  document.getElementById('input-subtotal').value = '00.00';
  total=0;
  descuento=0;
  subtotal=0;
  isv = 0;
  carrito = [];
  renderTabla();
}

function calcuarTotal(){
  let totalt = 0;
  let descuentot = 0;

  carrito.forEach((item, i) => {
    let d = item['Precio'] * (item['Descuento']/100);
    item['Total'] = Math.round(((item['Precio'] - d ) * item['Cantidad'])*100)/100;
    item['ISV'] = Math.round((item['Total'] - (item['Total']/1.15))*100)/100;

    descuentot += d * item['Cantidad'];
    totalt += item['Total'];
  });

  total = Math.round(totalt*100)/100;
  descuento = Math.round(descuentot*100)/100;
  isv = Math.round((total-total/1.15)*100)/100;
  subtotal = total - isv;

  document.getElementById('input-subtotal').value = Math.round((total-isv)*100)/100;
  document.getElementById('input-ivs').value = isv;
  document.getElementById('input-descuento').value = descuento;
  document.getElementById('input-total').value = total;

}

function cambioPrecio(){
  document.getElementById('inputPrecioVenta').value=document.getElementById('select-productos').value;
}

function escanearID(event){
  if (event.keyCode == 13 && document.getElementById('input-cliente').value!='') {
    let cadenas = document.getElementById('nombreCliente').value.split(",");
    if (cadenas.length>7) {
      document.getElementById('RTNCliente').value=cadenas[2];
      document.getElementById('nombreCliente').value= cadenas[3] + " " + cadenas[4] + " " + cadenas[5] + " " + cadenas[6];
      cadenas = null;
    }
  }
}

function validaCampos(){
  let numFactura = document.getElementById('input-numero-factura').value;
  let cliente = document.getElementById('input-cliente').value;
  let rtn = document.getElementById('input-rtn').value;
  if (numFactura!='' && cliente!='' && carrito.length>0) {
    document.getElementById('btn-guardar').disabled = false;
    return true;
  }
  document.getElementById('btn-guardar').disabled = true;
  return false;
}

cambioPrecio();
formatearProductos();
siscan();
shortcut.add("Ctrl+1", escanearID);
shortcut.add("Ctrl+2", ()=>{$('#nuevoConsulta').modal('show')});
shortcut.add("Ctrl+3", adelantoEmpleado);
