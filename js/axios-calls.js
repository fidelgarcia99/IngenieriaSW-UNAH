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

var renderTabla = function(param,id,api){

  var dataa = obtenerRegistros(param,id,api);
  dataa.then((data)=>{
    document.getElementById('tbody').innerHTML='';
    document.getElementById('thead').innerHTML='';
    //Se agrega el nombre de las columnas
    let nombreCol = '';
    for(let i in data[0]){
        nombreCol+=`
            <td>${i}</td>
        `;
    }
    document.getElementById('thead').innerHTML+=`
    <tr>${nombreCol}</tr>
    `;
    //Se gregan las filas de datos
    data.forEach(element => {
        let fila='';
        for(let i in element){
            fila+=`
                <td>${element[i]}</td>
            `;
        }
        document.getElementById('tbody').innerHTML+=`
        <tr>${fila}</tr>
        `;
    });
    $('#dataTable').DataTable();
  });
}
