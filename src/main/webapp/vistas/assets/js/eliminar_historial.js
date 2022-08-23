if (document.getElementsByClassName('eliminarHistorial') != null) {
    function sweliminarHistorial(idHistorial, id_rev) {
        if (idHistorial != null) {
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
                        eliminarHistorial(idHistorial);
                        setTimeout(function() {
                            parent.location.href = "controlRevision?id=" + id_rev + "&result=true&message=Elemento%20eliminado%20correctamente&status=200"
                        }, 1800);
                    }
                });
        } else {
            swal("Error", "Un error interno ocurrió dentro del sistema", "error");
        }

        function eliminarHistorial(idHistorial) {
            var url = "eliminarHistRev?id_rev="+ id_rev +"&id_hist="+idHistorial;
            $.ajax({
                type: 'POST',
                url: url,
                async: true,
                success: function() {
                    swal("¡Eliminado!", "El elemento del historial se ha eliminado correctamente", "success");
                },
                error: function() {
                    swal("Error", "Un error interno ocurrió dentro del sistema", "error");
                }

            });
        }
    }
}