var readCookie = function(name) {
    return decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + name.replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null;
}

var obtenerRegistros = async function(param,id,api){
    let params;
    let resultado;
    if(param==null){
        params={token:readCookie('token')};
    }else{
        params={token:readCookie('token'),param:param, id:id}
    }

    await axios({
            url:`http://${window.location.hostname}/IngenieriaSW-UNAH/php/api/${api}.php`,
            method:'get',
            responseType:'json',
            params:params
        }).then(res=>{
          resultado = res.data;
        }).catch(err=>{
            console.error(err);
        });
        return resultado;
}

var renderTabla = function(param,id,api){

  var dataa = obtenerRegistros(param,id,api);
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
      if (api=="clientes" || api=='usuarios' || api=='inventario') {
        nombreCol+=`<td></td>`;
      }
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
                  fila+=`
                      <td>${element[i]}</td>
                  `;
              }
          }
          if(api=="clientes" || api=='usuarios' || api=='inventario'){
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
          }
          document.getElementById('tbody').innerHTML+=`
          <tr onclick="formatearDescrip();">${fila}</tr>
          `;
      });
      $('#dataTable').DataTable();
    }
  });
}

var nuevoRegistro = async function(data,api){
  let respuesta=null;
    await axios({
            url:`http://${window.location.hostname}/IngenieriaSW-UNAH/php/api/${api}.php`,
            method:'post',
            responseType:'json',
            data:data
        }).then(res=>{
            respuesta=res.data;
        }).catch(err=>{
            console.error(err);
        });
        return respuesta;
}

var eliminarRegistroId = async function(data,api){
    let respuesta=null;
      await axios({
              url:`http://${window.location.hostname}/IngenieriaSW-UNAH/php/api/${api}.php`,
              method:'delete',
              responseType:'json',
              data:data
          }).then(res=>{
              respuesta=res.data;
          }).catch(err=>{
              console.error(err);
          });
          return respuesta;
}

var actualizaRegistro = async function(data,api){
  let respuesta=null;
    await axios({
            url:`http://${window.location.hostname}/IngenieriaSW-UNAH/php/api/${api}.php`,
            method:'put',
            responseType:'json',
            data:data
        }).then(res=>{
            respuesta=res.data;
        }).catch(err=>{
            console.error(err);
        });
        return respuesta;
}
