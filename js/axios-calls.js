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
