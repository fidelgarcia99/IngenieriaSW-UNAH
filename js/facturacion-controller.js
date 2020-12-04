var clientes = null;

function cargarClientes() {
  document.getElementById("nom_cliente").innerHTML = "";
  clientes = new Array();
  obtenerRegistros(null, null, "empresasclientes")
    .then((data) => {
      data.forEach((item, i) => {
        clientes.push(item);
        document.getElementById("nom_cliente").innerHTML += `
        <option value="${item["idEmpresaCliente"]}">${item["nombreEmpresa"]}</option>
      `;
      });
      cambioRtn();
    })
    .catch((err) => {
      console.error(err);
    });
}

async function guardarCliente() {
  if (
    document.getElementById("RTNCliente").value != "" &&
    document.getElementById("nombreCliente") != "" &&
    document.getElementById("nombreCliente") != "Consumidor Final"
  ) {
    let nuevoCliente = {
      nombre: document.getElementById("nombreCliente").value,
      RTN: document.getElementById("RTNCliente").value,
    };

    let respuesta = null;
    respuesta = await nuevoRegistro(nuevoCliente, "empresasclientes");

    if (respuesta != null) {
      if (respuesta.res == "OK") {
        document.getElementById("modal-success-message").innerHTML =
          respuesta.mensaje;
        $("#modal-success").modal("show");
        setTimeout(() => $("#modal-success").modal("hide"), 2000);
      } else {
        document.getElementById("errorMessage").innerHTML = respuesta.mensaje;
        document.getElementById("errorMessage").style = "display:block";
        setTimeout(() => {
          document.getElementById("errorMessage").style = "display:none";
        }, 2000);
      }
    }
  }
}

function cambioRtn() {
  document.getElementById("inputId").value =
    clientes[document.getElementById("nom_cliente").selectedIndex]["RTN"];
}

function escogeCliente() {
  document.getElementById("nombreCliente").value = document.getElementById(
    "nom_cliente"
  ).options[document.getElementById("nom_cliente").selectedIndex].text;
  document.getElementById("RTNCliente").value = document.getElementById(
    "inputId"
  ).value;
}

