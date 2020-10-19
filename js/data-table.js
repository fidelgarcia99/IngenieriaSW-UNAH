var readCookie = function (name) {
  return (
    decodeURIComponent(
      document.cookie.replace(
        new RegExp(
          "(?:(?:^|.*;)\\s*" +
            name.replace(/[\-\.\+\*]/g, "\\$&") +
            "\\s*\\=\\s*([^;]*).*$)|^.*$"
        ),
        "$1"
      )
    ) || null
  );
};

var rellenaTabla = async function (id, api) {
  let params;
  if (id == null) {
    params = { token: readCookie("token") };
  } else {
    params = { token: readCookie("token"), id: id };
  }

  await axios({
    url: `http://${window.location.hostname}/IngenieriaSW-UNAH/php/api/${api}.php`,
    method: "get",
    responseType: "json",
    params: params,
  })
    .then((res) => {
      //Se agrega el nombre de las columnas
      let nombreCol = "";
      for (let i in res.data[0]) {
        nombreCol += `
                    <td>${i}</td>
                `;
      }
      document.getElementById("thead").innerHTML += `
            <tr>${nombreCol}</tr>
            `;

      let opciones = '<option value="">-----</option>';
      for (let i in res.data[0]) {
        opciones += `
            <option value="${i}">${i}</opction>
        `;
      }
      document.getElementById("selectIdEmpleado").innerHTML = opciones;

      //Se gregan las filas de datos
      res.data.forEach((element) => {
        let fila = "";
        for (let i in element) {
          fila += `
                        <td>${element[i]}</td>
                    `;
        }
        document.getElementById("tbody").innerHTML += `
                <tr>${fila}</tr>
                `;
      });
    })
    .catch((err) => {
      console.log(err);
    });

  $("#dataTable").DataTable();
};
