function renderTabla(param,id,api,tabla){

  var dataa = obtenerRegistros(param,id,api);
  dataa.then((data)=>{
    if (data!=null && data.length>0) {

      let thead = tabla.tHead;
      let tbody = tabla.tBodies[0];
      thead.innerHTML='';
      tbody.innerHTML='';

      //Se agrega el nombre de las columnas
      let nombreCol = '';
      for(let i in data[0]){
          nombreCol+=`
              <td>${i}</td>
          `;
      }
      thead.innerHTML+=`
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

          if (api=="usuarios" || api=="compras") {
          var modulos=`onmouseover="mouseOverRow(this)" onmouseout="mouseOutRow(this)" onclick="selectRow(${element['Id']},this)"`;
          }
          tbody.innerHTML+=`
          <tr ${modulos}]>${fila}</tr>
          `;
      });
      $('#dataTable').DataTable();
    }
  });
}
