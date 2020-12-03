function formatDescrip(desc){
  desc = JSON.parse(desc);
  let resp='';

  switch (desc['categoria']) {
    case 'Llantas':
    resp = `${desc['altura']}/${desc['ancho']}/${desc['tipo']}${desc['diametro']} para ${desc['vehiculo']} ${desc['observacion']}`;
    break;
    case 'Aceites':
    resp=`${desc['base']} SAE ${desc['saelow']}${desc['saehigh']} API ${desc['apiservice']}-${desc['tiempos']} ${desc['volumen']}${desc['unidad']}`;
    break;
    case 'Lubricantes':
    resp=`${desc['tipo']} ${desc['viscosidad']} ${desc['volumen']}${desc['unidad']}`;
    break;
    case 'Consumibles':
    resp=`${desc['nombre']} Vence: ${desc['caducidad']}`;
    break;
    case 'Neumaticos':
    let t ='';
    resp=`R${desc['diametro']} valvula ${desc['valvula']} para ${desc['vehiculo']} ${desc['observacion']}`;
    break;
    case 'Accesorios':
    resp="Accesorios";
    resp=`${desc['general']}`;
    break;
  }
  return resp;
}
