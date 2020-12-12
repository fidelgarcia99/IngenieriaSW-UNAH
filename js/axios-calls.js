var readCookie = function(name) {
    return decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + name.replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null;
}

var obtenerRegistros = async function(param,value,api){
    let resultado;
    let params={param:param, value:value}

    await axios({
            url:`http://${window.location.hostname}/IngenieriaSW-UNAH/php/api/${api}.php`,
            method:'get',
            responseType:'json',
            params:params
        }).then(res=>{
          if (res.data!=null) {
            if (res.data.res=="fail" && res.data.mensaje =="401: Acceso no autorizado") {
              location.href="?view=401";
            }else{
              resultado = res.data;
            }
          }
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
