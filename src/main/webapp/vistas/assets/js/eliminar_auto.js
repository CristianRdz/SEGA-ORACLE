if (document.getElementsByClassName('eliminarAuto') != null) {
    function sweliminarAuto(matricula) {
        if (matricula != null) {
            swal({
                    title: "¿Esta seguro de eliminar?",
                    text: "Una vez eliminado no podrás verlo en el sistema",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Eliminar",
                    cancelButtonClass: "btn-success",
                    cancelButtonText: "Cancelar",
                    closeOnConfirm: false,
                    closeOnCancel: true
                },
                function (isConfirm) {
                    if (isConfirm) {
                        eliminarAuto(matricula);
                        setTimeout(function () {
                            parent.location.href = "gestionAutos?result=true&message=Auto%20eliminado%20correctamente&status=200";
                        }, 1800);
                    }
                });
        } else {
            swal("Error", "Un error interno ocurrió dentro del sistema", "error");
        }

        function eliminarAuto(matricula) {
            var url = "eliminarAuto?matricula=" + matricula;
            $.ajax({
                type: 'POST',
                url: url,
                async: true,
                success: function () {
                    swal("¡Eliminado!", "El auto se ha eliminado correctamente", "success");
                },
                error: function () {
                    swal("Error", "Un error interno ocurrió dentro del sistema", "error");
                }

            });
        }
    }
}