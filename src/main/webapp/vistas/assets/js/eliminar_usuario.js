if (document.getElementsByClassName('eliminarUsuario') != null) {
    function sweliminarUsuario(idUsuario) {
        if (idUsuario != null) {
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
                function(isConfirm) {
                    if (isConfirm) {
                        eliminarUsuario(idUsuario);
                        setTimeout(function() {
                            parent.location.href = "gestionUsuarios?result=true&message=Usuario%20eliminado%20correctamente&status=200"
                        }, 1800);
                    }
                });
        } else {
            swal("Error", "Un error interno ocurrió dentro del sistema", "error");
        }

        function eliminarUsuario(idUsuario) {
            var url = "eliminarUsuario?id="+idUsuario;
            $.ajax({
                type: 'POST',
                url: url,
                async: true,
                success: function() {
                    swal("¡Eliminado!", "El usuario se ha eliminado correctamente", "success");
                },
                error: function() {
                    swal("Error", "Un error interno ocurrió dentro del sistema", "error");
                }

            });
        }
    }
}