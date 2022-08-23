if (document.getElementsByClassName('eliminarElemento') != null) {
    function sweliminarElemento(idElemento) {
        if (idElemento != null) {
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
                        eliminarElemento(idElemento);
                        setTimeout(function () {
                            parent.location.href = "gestionCatalogo?result=true&message=Elemento%20eliminado%20correctamente&status=200";
                        }, 1800);
                    }
                });
        } else {
            swal("Error", "Un error interno ocurrió dentro del sistema", "error");
        }

        function eliminarElemento(idElemento) {
            var url = "eliminarElemento?id_elemento=" + idElemento;
            $.ajax({
                type: 'POST',
                url: url,
                async: true,
                success: function () {
                    swal("¡Eliminado!", "El elemento del catálogo se ha eliminado correctamente", "success");
                },
                error: function () {
                    swal("Error", "Un error interno ocurrió dentro del sistema", "error");
                }

            });
        }
    }
}