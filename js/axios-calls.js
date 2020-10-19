var readCookie = function(name) {
    return decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + name.replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null;
}

var obtenerRegistros = async function(id,api){
    let params;
    if(id==null){
        params={token:readCookie('token')};
    }else{
        params={token:readCookie('token'),id:id}
    }

    await axios({
            url:`http://${window.location.hostname}/IngenieriaSW-UNAH/php/api/${api}.php`,
            method:'get',
            responseType:'json',
            params:params
        }).then(res=>{
            //Se agrega el nombre de las columnas
            let nombreCol = '';
            for(let i in res.data[0]){
                nombreCol+=`
                    <td>${i}</td>
                `;
            }
            document.getElementById('thead').innerHTML+=`
            <tr>${nombreCol}</tr>
            `;
            //Se gregan las filas de datos
            res.data.forEach(element => {
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

        }).catch(err=>{
            console.error(err);
        });

        $('#dataTable').DataTable();
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
