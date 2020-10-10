
var isCamposLlenos = function(){
    let userId = document.getElementById('inputID');
    let passwd = document.getElementById('inputPasswd');
    let errMes = document.getElementById('errorMessage');

    if(userId.value=='')
        userId.classList='form-control form-control-user is-invalid';
        else
        userId.classList='form-control form-control-user';

    if(passwd.value=='')
        passwd.classList='form-control form-control-user is-invalid';
        else
        passwd.classList='form-control form-control-user';

    if(userId.value=='' && passwd.value==''){
        errMes.innerHTML = 'Ingrese ambos campos.';
        errMes.style='display:block';
    }else if(userId.value!='' && passwd.value!=''){        
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
            url:'http://localhost/IngenieriaSW/INGENIERIASW-UNAH/php/api/login.php',
            method:'post',
            responseType:'json',
            data:urlEnconde
        }).then(res=>{
             if (res.data.res=='OK') {
                 window.location.href='/';
             }else{
                 errMes.innerHTML=res.data.mensaje;
                 document.getElementById('errorMessage').style.display='block';            
             }
        }).catch(err=>{
            console.log(err);
        });
    }

   
}
