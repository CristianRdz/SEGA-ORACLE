if (document.getElementsByClassName('eliminarRevision') != null) {
    function sweliminarRevision(idRevision) {
        if (idRevision != null) {
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
                        eliminarRevision(idRevision);
                        setTimeout(function () {
                            parent.location.href = "gestionRevisiones?result=true&message=Revision%20eliminada%20correctamente&status=200";
                        }, 1800);
                    }
                });
        } else {
            swal("Error", "Un error interno ocurrió dentro del sistema", "error");
        }

        function eliminarRevision(idRevision) {
            var url = "eliminarRevision?id_rev=" + idRevision;
            $.ajax({
                type: 'POST',
                url: url,
                async: true,
                success: function () {
                    swal("¡Eliminado!", "La revisión se ha eliminado correctamente", "success");
                },
                error: function () {
                    swal("Error", "Un error interno ocurrió dentro del sistema", "error");
                }

            });
        }
    }
}