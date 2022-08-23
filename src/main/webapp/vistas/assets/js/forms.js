// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
})()
if (document.getElementById("limpiar") != null) {
    const selecionElemento = document.getElementById("limpiar");
    selecionElemento.addEventListener("click", function () {
        const cantidad = document.getElementById("cantidad");
        cantidad.removeAttribute('disabled');
        cantidad.setAttribute('placeholder', 'Coloca un número entero ejemplo: 5 o 40');
        cantidad.value = "";
    });
}
if (document.getElementById("tipo_elemento") != null) {
    const selecionElemento = document.getElementById("tipo_elemento");
    const  etiqueta =document.getElementById('cantlbl');
    selecionElemento.addEventListener("change", function () {
        if (selecionElemento.value == "Servicio") {
            const cantidad = document.getElementById("cantidad");
            if (cantidad.value != null) {
                cantidad.value = "1";
                cantidad.setAttribute('hidden', '');
                etiqueta.setAttribute('hidden','');
                cantidad.removeAttribute('placeholder');
            }
        } else {
            const cantidad = document.getElementById("cantidad");
            cantidad.removeAttribute('hidden');
            etiqueta.removeAttribute('hidden');
            cantidad.setAttribute('placeholder', 'Coloca un número entero ejemplo: 5 o 40');
            cantidad.value = "";
        }
    });

}

if (document.getElementById("tipo_llave") != null && document.getElementById("txtid")) {
    const selecionElemento = document.getElementById("tipo_llave");
    const textoEtiqueta = document.getElementById("txtid");
    selecionElemento.addEventListener("change", function () {
        if (selecionElemento.value == "rfc") {
            const llave = document.getElementById("llave");
            if (llave.value != null) {
                llave.value = "";
                var regex = /^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$/;
                llave.setAttribute('type','text');
                llave.setAttribute('maxlength', '13');
                llave.setAttribute('minlength', '12');
                llave.setAttribute('pattern',regex.source);
                llave.setAttribute('placeholder', 'CACX7605101P8...');
                llave.setAttribute('onkeyup', 'this.value = this.value.toUpperCase()');
                llave.removeAttribute('disabled');
                textoEtiqueta.innerText='RFC de dueño';
            }
        } else {
            const llave = document.getElementById("llave");
            llave.value = "";
            llave.setAttribute('type','email');
            llave.removeAttribute('minlength');
            llave.removeAttribute('pattern');
            llave.setAttribute('maxlength', '100');
            llave.setAttribute('placeholder', 'ejemplo@ejemplo.com');
            llave.setAttribute('onkeyup', 'this.value = this.value.toLowerCase()');
            llave.removeAttribute('disabled');
            textoEtiqueta.innerText='Correo de dueño';

        }
    });

}
if (document.getElementById("tipo_elemento_saved") != null) {
    const selecionElemento = document.getElementById("tipo_elemento_saved");
    const  etiqueta =document.getElementById('cantlbl');
    console.log(selecionElemento.value);
    if (selecionElemento.value == "Servicio") {
        const cantidad = document.getElementById("cantidad");
        if (cantidad.value != null) {
            cantidad.value = "1";
            cantidad.setAttribute('hidden', '');
            etiqueta.setAttribute('hidden','');
            cantidad.removeAttribute('placeholder');
        }
    } else {
        const cantidad = document.getElementById("cantidad");
        cantidad.removeAttribute('hidden');
        etiqueta.removeAttribute('hidden');
        cantidad.setAttribute('placeholder', 'Coloca un número entero ejemplo: 5 o 40');
    }
}
if (document.getElementById("forma_pago") != null) {
    const selecionElemento = document.getElementById("forma_pago");

    selecionElemento.addEventListener("change", function () {
        if (selecionElemento.value == "Efectivo") {
            const efectivo = document.getElementById("cont_pago");
            const tarjeta = document.getElementById("tarjeta");
            efectivo.removeAttribute('hidden');
            tarjeta.setAttribute('hidden', '');
        } else {
            const efectivo = document.getElementById("cont_pago");
            const tarjeta = document.getElementById("tarjeta");
            efectivo.setAttribute('hidden', '');
            tarjeta.removeAttribute('hidden');
        }
    });

}

if (document.getElementsByClassName("edo_pago") != null && document.getElementsByClassName("botonpago") != null) {
    const estado = document.getElementsByClassName("edo_pago");
    const boton = document.getElementsByClassName("botonpago");
    for (let i = 0; i < estado.length; i++) {
        switch (estado[i].textContent) {
            case '3':
                estado[i].innerHTML = "<div class='bg-danger bg-gradient text-light text-center rounded p-1 m-1'>Rechazado</div> ";
                boton[i].innerHTML = "";
                break;
            case '2':
                estado[i].innerHTML = "<div class='bg-success bg-gradient text-light text-center rounded p-1 m-1'>Pagado</div> ";
                boton[i].innerHTML = "";
                break;
            case '1':
                estado[i].innerHTML = "<div class='bg-primary bg-gradient text-light text-center rounded p-1 m-1'>Enviado</div> ";
                boton[i].innerHTML = "";
                break;
            case '0':
                estado[i].innerHTML = "<div class='bg-warning bg-gradient text-light text-center rounded p-1 m-1'>Pendiente</div> ";
                break;
            default:
                estado[i].innerHTML = "<div class='bg-danger bg-gradient text-light text-center rounded p-1 m-1'>Indefinido</div> ";
                break;
        }
    }

}
if (document.getElementsByClassName("rol_usuario")) {
    const rol = document.getElementsByClassName("rol_usuario");
    for (let i = 0; i < rol.length; i++) {
        switch (rol[i].textContent) {
            case "1":
                rol[i].innerHTML = "<div class='bg-gradient text-light text-center rounded p-1 m-1 gerente'>Gerente</div> ";
                break;
            case "2":
                rol[i].innerHTML = "<div class='bg-gradient text-light text-center rounded p-1 m-1 cliente'>Cliente</div> ";
                break;
            case "3":
                rol[i].innerHTML = "<div class='bg-gradient text-light text-center rounded p-1 m-1 asistente'>Asistente</div> ";
                break;
            case "4":
                rol[i].innerHTML = "<div class='bg-gradient text-light text-center rounded p-1 m-1 cajero'>Cajero</div> ";
                break;
            case "5":
                rol[i].innerHTML = "<div class='bg-gradient text-light text-center rounded p-1 m-1 mecanico'>Mecánico</div> ";
                break;
            default:
                rol[i].innerHTML = "<div class='bg-danger bg-gradient text-light text-center rounded p-1 m-1'>No definido</div> ";
                break;
        }
    }

}
if (document.getElementsByClassName('control') != null && document.getElementsByClassName('fstbl') != null) {
    const control = document.getElementsByClassName('control');
    const fase = document.getElementsByClassName('fstbl');
    for (let i = 0; i < fase.length; i++) {
        switch (fase[i].textContent) {
            case 'Ingreso':
                break;
            case 'Inspección y realización':
                break;
            case 'En pruebas':
                break;
            case 'Salida del taller':
                control[i].innerHTML = "";
                break;
            case 'Finalizado':
                control[i].innerHTML = "";
                break;
            case 'Cancelado':
                control[i].innerHTML = "";
                break;
            default:
                control[i].innerHTML = "";
                break;
        }
    }
}
if (document.getElementsByClassName('editar_cant') != null && document.getElementsByClassName('serv') != null) {
    const control = document.getElementsByClassName('editar_cant');
    const fase = document.getElementsByClassName('serv');
    for (let i = 0; i < fase.length; i++) {
        switch (fase[i].textContent) {
            case 'Producto':
                break;
            case 'Servicio':
                control[i].innerHTML = "";
                break;
            default:
                control[i].innerHTML = "";
                break;
        }
    }
}

function enablerTag() {
    const inputs = document.getElementsByClassName('editable');
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].removeAttribute('disabled');
    }
    const enabler = document.getElementById('enabler');
    enabler.setAttribute('onclick', 'disablerTag()');
    enabler.setAttribute('class', 'btn btn-danger m-1');
    enabler.innerHTML = 'No editar <span class="bi bi-x-lg"></span>';
}

function disablerTag() {
    const inputs = document.getElementsByClassName('editable');
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].setAttribute('disabled', '');
    }
    const enabler = document.getElementById('enabler');
    enabler.setAttribute('onclick', 'enablerTag()');
    enabler.setAttribute('class', 'btn btn-warning m-1');
    enabler.innerHTML = 'Editar <span class="bi bi-pencil-square"></span>';
}