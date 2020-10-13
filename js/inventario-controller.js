var readCookie = function(name) {
    return decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + name.replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null;
}

var verInventario = function(){
    

    axios({
            url:'http://localhost/IngenieriaSW/INGENIERIASW-UNAH/php/api/inventario.php',
            method:'GET',
            responseType:'json',
            params:{token:readCookie('token')}
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
            console.log(err);
        });

}

verInventario();