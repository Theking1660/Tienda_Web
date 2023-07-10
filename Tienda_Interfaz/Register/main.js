
async function registrar() {

    
    const api =  "https://localhost:7266/api/";
    var datos_pe = {
        "perfil_id":0,
        "tipo_perfil":1,
        "nombre": document.getElementById("Nombre").value,
        "apellidos": documente.getElementById("Apellidos").value,
        "numero":document.getElementById("Numero").value,
        "correo":document.getElementById("Correo").value,
        "contraseña": document.getElementById("Contra_2").value,
        "fecha_Nacimiento":document.getElementById("Nacimiento").value,
        "activacionDP":false,
        "membresia":false,
        "fecha_creacion":'0000-00-00'
    }
    let N = Math.floor(Math.random() * 9) + 1
    let codigo = (document.getElementById("Nombre").value).substring(0, 1) + (document.getElementById("Apellidos").value).substring(0, 1) + (document.getElementById("Mumero").value).substring(datos_pe["numero"].length - 2) + N;
    var datos_cu = {
        
            
                "cuenta_id": 0,
                "perfil_id": 1,
                "metodoP_id": 1,
                "direccion_id": 1,
                "cuenta": codigo,
                "fecha_creacion": "2023-07-10T01:00:06.329Z",
                "fecha_actualizacion": "2023-07-10T01:00:06.329Z"

    }
    var response = await fetch(api + "Perfil", {
        "method": 'post',
        "body": JSON.stringify(datos_pe),
        "headers": {
            "Content-Type": 'application/json'
        }
    });
    
    var responder = await fetch(api + "Cuenta", {
        method: 'post',
        "body": JSON.stringify(datos_cu),
        headers: {
            "Content-Type": 'application/json'
        }
    });
    alert("Funcionnaaaa");
    console.log(response);
    console.log(responder);
}