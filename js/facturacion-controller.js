function cambioRtn()
{
    document.getElementById('inputId').value=document.getElementById('nom_cliente').value;
}

function escogeCliente(){
  document.getElementById('nombreCliente').value = document.getElementById('nom_cliente').options[document.getElementById('nom_cliente').selectedIndex].text;
  document.getElementById('RTNCliente').value = document.getElementById('inputId').value;
}


cambioRtn();
