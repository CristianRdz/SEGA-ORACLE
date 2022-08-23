if (document.getElementsByClassName('pagar') != null || document.getElementsByClassName('aprobar') != null) {
    function swAccionarPago(id_rev,id_pago) {
        if (id_pago != null && id_rev != null) {
            swal({
                    title: "¿Esta seguro de esta acción?",
                    text: "Una vez hecha no podrá revertirse",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Aceptar",
                    cancelButtonClass: "btn-success",
                    cancelButtonText: "Cancelar",
                    closeOnConfirm: false,
                    closeOnCancel: true
                },
                function(isConfirm) {
                    if (isConfirm) {
                        accionarPago(id_rev,id_pago);
                        setTimeout(function() {
                            parent.location.href = "verPagos?result=true&message=Pago%20aplicado%20correctamente&status=200"
                        }, 1800);
                    }
                });
        } else {
            swal("Error", "Un error interno ocurrió dentro del sistema", "error");
        }

        function accionarPago(id_rev,id_pago) {
            let url = "accionarPago?id_rev="+id_rev+"&id_pago="+ id_pago;
            $.ajax({
                type: 'POST',
                url: url,
                async: true,
                success: function() {
                    swal("¡Aplicado!", "Pago aplicado", "success");
                },
                error: function() {
                    swal("Error", "Un error interno ocurrió dentro del sistema", "error");
                }

            });
        }
    }
}