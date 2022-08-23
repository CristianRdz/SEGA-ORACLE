$(document).ready(function() {
    var table = $("table").DataTable({
        columnDefs: [{
            targets: "rol",
            sortable: true,
            render: function(data, type, full, meta) {
                switch (data) {
                    case "1":
                        return "<div class='bg-gradient text-light text-center rounded p-1 m-1 gerente'>Gerente</div> ";
                        break;
                    case "2":
                        return "<div class='bg-gradient text-light text-center rounded p-1 m-1 cliente'>Cliente</div> ";
                        break;
                    case "3":
                        return "<div class='bg-gradient text-light text-center rounded p-1 m-1 asistente'>Asistente</div> ";
                        break;
                    case "4":
                        return "<div class='bg-gradient text-light text-center rounded p-1 m-1 cajero'>Cajero</div> ";
                        break;
                    case "5":
                        return "<div class='bg-gradient text-light text-center rounded p-1 m-1 mecanico'>Mecánico</div> ";
                        break;
                    default:
                        return "<div class='bg-danger bg-gradient text-light text-center rounded p-1 m-1'>No definido</div> ";
                        break;
                }
            },
        }, {
            targets: "tipo",
            sortable: true,
            render: function(data, type, full, meta) {
                switch (data) {
                    case 'Servicio':
                        return "<div class='bg-primary bg-gradient text-light text-center rounded p-1 m-1'>Servicio</div> ";
                        break;
                    case 'Producto':
                        return "<div class='bg-success bg-gradient text-light text-center rounded p-1 m-1'>Producto</div> ";
                        break;
                    default:
                        return "<div class='bg-danger bg-gradient text-light text-center rounded p-1 m-1'>No definido</div> ";
                        break;
                }
            },
        }, {
            targets: "fase",
            sortable: true,
            render: function(data, type, full, meta) {
                switch (data) {
                    case 'Ingreso':
                        return "<div class='bg-secondary bg-gradient text-light text-center rounded p-1 m-1'>Ingreso</div> ";
                        break;
                    case 'Inspección y realización':
                        return "<div class='bg-info bg-gradient text-light text-center rounded p-1 m-1'>Inspección y realización</div> ";
                        break;
                    case 'En pruebas':
                        return "<div class='bg-warning bg-gradient text-light text-center rounded p-1 m-1'>En Pruebas</div> ";
                        break;
                    case 'Salida del taller':
                        return "<div class='bg-primary bg-gradient text-light text-center rounded p-1 m-1'>Salida del taller</div> ";
                        break;
                    case 'Finalizado':
                        return "<div class='bg-success bg-gradient text-light text-center rounded p-1 m-1'>Finalizado</div> ";
                        break;
                    case 'Cancelado':
                        return "<div class='bg-danger bg-gradient text-light text-center rounded p-1 m-1'>Cancelado</div> ";
                        break;
                    default:
                        return "<div class='bg-danger bg-gradient text-light text-center rounded p-1 m-1'>Indefinida</div> ";
                        break;
                }
            },
        }, {
            targets: "edo_pago",
            sortable: true,
            render: function(data, type, full, meta) {
                switch (data) {
                    case '1':
                        return "<div class='bg-success bg-gradient text-light text-center rounded p-1 m-1'>Pagado</div> ";
                        break;
                    case '0':
                        return "<div class='bg-warning bg-gradient text-light text-center rounded p-1 m-1'>Pendiente</div> ";
                        break;
                    default:
                        return "<div class='bg-danger bg-gradient text-light text-center rounded p-1 m-1'>Indefinido</div> ";
                        break;
                }
            },
        }, {
            targets: "nosort",
            sortable: false,
            orderable: false
        }, ],

        language: {
            processing: "Procesando...",
            lengthMenu: "Mostrar _MENU_ registros",
            zeroRecords: "No se encontraron resultados",
            emptyTable: "Ningún dato disponible en esta tabla",
            infoEmpty: "No hay entradas",
            infoFiltered: "(filtrado de un total de _MAX_ registros)",
            search: "Buscar:",
            infoThousands: ",",
            loadingRecords: "Cargando...",
            paginate: {
                first: "Primero",
                last: "Último",
                next: "Siguiente",
                previous: "Anterior",
            },
            aria: {
                sortAscending: ": Activar para ordenar la columna de manera ascendente",
                sortDescending: ": Activar para ordenar la columna de manera descendente",
            },
            buttons: {
                copy: "Copiar",
                colvis: "Visibilidad",
                collection: "Colección",
                colvisRestore: "Restaurar visibilidad",
                copyKeys: "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
                copySuccess: {
                    1: "Copiada 1 fila al portapapeles",
                    _: "Copiadas %d fila al portapapeles",
                },
                copyTitle: "Copiar al portapapeles",
                csv: "CSV",
                excel: "Excel",
                pageLength: {
                    "-1": "Mostrar todas las filas",
                    1: "Mostrar 1 fila",
                    _: "Mostrar %d filas",
                },
                pdf: "PDF",
                print: "Imprimir",
            },
            autoFill: {
                cancel: "Cancelar",
                fill: "Rellene todas las celdas con <i>%d<\/i>",
                fillHorizontal: "Rellenar celdas horizontalmente",
                fillVertical: "Rellenar celdas verticalmentemente",
            },
            decimal: ",",
            searchBuilder: {
                add: "Añadir condición",
                button: {
                    0: "Constructor de búsqueda",
                    _: "Constructor de búsqueda (%d)",
                },
                clearAll: "Borrar todo",
                condition: "Condición",
                conditions: {
                    date: {
                        after: "Despues",
                        before: "Antes",
                        between: "Entre",
                        empty: "Vacío",
                        equals: "Igual a",
                        notBetween: "No entre",
                        notEmpty: "No Vacio",
                        not: "Diferente de",
                    },
                    number: {
                        between: "Entre",
                        empty: "Vacio",
                        equals: "Igual a",
                        gt: "Mayor a",
                        gte: "Mayor o igual a",
                        lt: "Menor que",
                        lte: "Menor o igual que",
                        notBetween: "No entre",
                        notEmpty: "No vacío",
                        not: "Diferente de",
                    },
                    string: {
                        contains: "Contiene",
                        empty: "Vacío",
                        endsWith: "Termina en",
                        equals: "Igual a",
                        notEmpty: "No Vacio",
                        startsWith: "Empieza con",
                        not: "Diferente de",
                    },
                    array: {
                        not: "Diferente de",
                        equals: "Igual",
                        empty: "Vacío",
                        contains: "Contiene",
                        notEmpty: "No Vacío",
                        without: "Sin",
                    },
                },
                data: "Data",
                deleteTitle: "Eliminar regla de filtrado",
                leftTitle: "Criterios anulados",
                logicAnd: "Y",
                logicOr: "O",
                rightTitle: "Criterios de sangría",
                title: {
                    0: "Constructor de búsqueda",
                    _: "Constructor de búsqueda (%d)",
                },
                value: "Valor",
            },
            searchPanes: {
                clearMessage: "Borrar todo",
                collapse: {
                    0: "Paneles de búsqueda",
                    _: "Paneles de búsqueda (%d)",
                },
                count: "{total}",
                countFiltered: "{shown} ({total})",
                emptyPanes: "Sin paneles de búsqueda",
                loadMessage: "Cargando paneles de búsqueda",
                title: "Filtros Activos - %d",
            },
            select: {
                1: "%d fila seleccionada",
                _: "%d filas seleccionadas",
                cells: {
                    1: "1 celda seleccionada",
                    _: "$d celdas seleccionadas",
                },
                columns: {
                    1: "1 columna seleccionada",
                    _: "%d columnas seleccionadas",
                },
            },
            thousands: ".",
            datetime: {
                previous: "Anterior",
                next: "Proximo",
                hours: "Horas",
                minutes: "Minutos",
                seconds: "Segundos",
                unknown: "-",
                amPm: ["am", "pm"],
            },
            editor: {
                close: "Cerrar",
                create: {
                    button: "Nuevo",
                    title: "Crear Nuevo Registro",
                    submit: "Crear",
                },
                edit: {
                    button: "Editar",
                    title: "Editar Registro",
                    submit: "Actualizar",
                },
                remove: {
                    button: "Eliminar",
                    title: "Eliminar Registro",
                    submit: "Eliminar",
                    confirm: {
                        _: "¿Está seguro que desea eliminar %d filas?",
                        1: "¿Está seguro que desea eliminar 1 fila?",
                    },
                },
                error: {
                    system: 'Ha ocurrido un error en el sistema (<a target="\\" rel="\\ nofollow" href="\\">Más información&lt;\\\/a&gt;).<\/a>',
                },
                multi: {
                    title: "Múltiples Valores",
                    info: "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
                    restore: "Deshacer Cambios",
                    noMulti: "Este registro puede ser editado individualmente, pero no como parte de un grupo.",
                },
            },
            info: "Mostrando de _START_ a _END_ de _TOTAL_ entradas",
        },
    });
})