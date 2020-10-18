
var teclea = function(input){
    input.classList='form-control form-control-user';
}

var isCampoVacio = function(input){
    if(input.value=='')
    input.classList='form-control form-control-user is-invalid';
    else
    input.classList='form-control form-control-user';

    let userId = document.getElementById('inputID');
    let passwd = document.getElementById('inputPasswd');
    let errMes = document.getElementById('errorMessage');
    if(userId.value!='' && passwd.value!=''){
        errMes.style='display:none';
    }

}

var isCamposLlenos = function(){
    let userId = document.getElementById('inputID');
    let passwd = document.getElementById('inputPasswd');
    let errMes = document.getElementById('errorMessage');

    if(userId.value=='' || passwd.value==''){
        errMes.innerHTML = 'Ingrese ambos campos.';
        errMes.style='display:block';
    }else{
        errMes.style='display:none';
    }
}

var validaLogin = function(){
    let userId = document.getElementById('inputID');
    let passwd = document.getElementById('inputPasswd');
    let errMes = document.getElementById('errorMessage');

    isCamposLlenos();

    if(userId.value!='' && passwd.value!=''){
        let urlEnconde = `usuario=${userId.value}&password=${passwd.value}`;
        axios({
            url:'http://localhost/IngenieriaSW-UNAH/php/api/login.php',
            method:'POST',
            responseType:'json',
            data:urlEnconde
        }).then(res=>{
             if (res.data.res=='OK') {
                 window.location.href='?view=index';
             }else{
                 errMes.innerHTML=res.data.mensaje;
                 document.getElementById('errorMessage').style.display='block';
             }
        }).catch(err=>{
            console.log(err);
        });
    }


}
