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
    //Se gregan las filas de datos
    data.forEach(element => {
        let fila='<td><input type="number" class="form-control" min="1" value="1" style="width:80px;"></td>';
        for(let i in element){
          if(i=="Descripcion"){
            element[i]=formatDescrip(element[i],element['Tipo']);
          }
          fila+=`
              <td>${element[i]}</td>
          `;
        }
        fila+=`<td>${element['Precio']}</td>`;
        tbody.innerHTML+=`
        <tr onmouseover="mouseOverRow(this)" onmouseout="mouseOutRow(this)">${fila}</tr>
        `;
    });
  }).catch(err=>{
    console.error(err);
  });
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
siscan();
