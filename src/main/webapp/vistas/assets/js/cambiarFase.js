if (document.getElementsByClassName('cambiarFase') != null) {
    function swcambiarFase(id_rev,fase) {
        if (id_rev != null && fase) {
            swal({
                    title: "¿Esta seguro de cambiar la fase?",
                    text: "Una vez cambiada solo la podrá cambiar en edición...",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Cambiar",
                    cancelButtonClass: "btn-success",
                    cancelButtonText: "Cancelar",
                    closeOnConfirm: false,
                    closeOnCancel: true
                },
                function(isConfirm) {
                    if (isConfirm) {
                        cambiarFase(id_rev,fase);
                        setTimeout(function() {
                            if (fase='En pruebas'){
                                parent.location.href = "gestionRevisiones?result=true&message=Control%20terminado&status=200";
                            }
                            parent.location.href = "controlRevision?id=" + id_rev + "&result=true&message=Fase%20actualizada%20correctamente&status=200"
                        }, 1800);
                    }
                });
        } else {
            swal("Error", "Un error interno ocurrió dentro del sistema", "error");
        }

        function cambiarFase(id_rev,fase) {
            var url = "cambiarFase?id_rev="+id_rev+"&fase="+fase;
            $.ajax({
                type: 'POST',
                url: url,
                async: true,
                success: function() {
                    swal("¡Actualizado!", "Fase actualizada", "success");
                },
                error: function() {
                    swal("Error", "Un error interno ocurrió dentro del sistema", "error");
                }

            });
        }
    }
}