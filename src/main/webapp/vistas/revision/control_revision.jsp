<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try {
        if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1") || session.getAttribute("rol").toString().equals("5")) {
%> <%-- Verificar que la sesión existe--%>
<c:if test="${control.fase == 'Finalizado' || control.fase == 'Cancelado'||control.fase == 'Salida del taller'}">
    <c:redirect url="gestionRevisiones?result=true&message=Control%20terminado&status=200"/>
</c:if><%-- se envia a gestion si la fase es una de las ultimas--%>
<c:choose>
    <c:when test="${not empty control}">
    </c:when>
    <c:otherwise>
        <c:redirect url="gestionRevisiones"/>
    </c:otherwise>
</c:choose>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Control de revisión</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>
<div class="container mt-5 p-5" data-aos="fade-up" data-aos-delay="100">
    <div class="main-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        Fase de la revisión y detalles del auto
                    </div>
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img
                                    src="vistas/assets/img/fases/${control.fase}.svg"
                                    alt="${control.fase}"
                                    class="p-1 bg-transparent"
                                    width="220"
                            />
                            <div class="mt-3">
                                <h5>${control.marca} ${control.modelo}</h5>
                            </div>
                        </div>
                        <hr class="my-2"/>
                        <ul class="list-group list-group-flush">
                            <li
                                    class="list-group-item d-flex justify-content-center align-items-center flex-wrap"
                            >
                                <a
                                        href="gestionRevisiones"
                                        class="btn btn-primary btn-sm m-1"
                                >Ir a pantalla de gestión <i class="bi bi-x-lg"></i
                                ></a>
                                <button class="btn btn-success btn-sm m-1 cambiarFase"
                                        type="button"
                                        onclick="swcambiarFase('${control.id_rev}','${control.fase}')">
                                    Pasar a la siguiente fase
                                    <i class="fa fa-arrow-circle-right"></i
                                    >
                                </button>
                            </li>

                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0">
                                    <span class="iconify" data-icon="radix-icons:id-card"></span> ID revisión:
                                </h6>
                                <span class="text-secondary">${control.id_rev}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0">
                                    <span class="bi bi-calendar-date"></span> Último movimiento:
                                </h6>
                                <span class="text-secondary">${control.fecha_ult_mov} </span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0">
                                    <span class="fa fa-credit-card"></span> Matrícula:
                                </h6>
                                <span class="text-secondary">${control.matricula}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0">
                                    <span class="fa fa-barcode"></span> NIV:
                                </h6>
                                <span class="text-secondary">${control.n_serie}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0">
                                    <span class="bi bi-card-text"></span> NCI:
                                </h6>
                                <span class="text-secondary">${control.n_constancia}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0">
                                    <span class="bi bi-paint-bucket"></span> Color:
                                </h6>
                                <span class="text-secondary">${control.color}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0">
                                    <span class="fa fa-oil-can"></span> Combustible:
                                </h6>
                                <span class="text-secondary">${control.tipo_combustible}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0">
                                    <span class="iconify" data-icon="tabler:engine"></span> Transmición:
                                </h6>
                                <span class="text-secondary">${control.tipo_transmision}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">
                        Añadir un elemento del catálago a la revisión
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <c:choose>
                                    <c:when test="${param['result']}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <c:out value="${param['message']}"></c:out>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                    aria-label="Close"></button>
                                        </div>
                                    </c:when>
                                    <c:when test="${param['result']==false}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <c:out value="${param['message']}"></c:out>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                    aria-label="Close"></button>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>

                                <form class="needs-validation" novalidate action="agregarHistRev" method="POST">
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <input type="hidden" id="id_rev" name="id_rev" value="${control.id_rev}">
                                                <label class="fw-bold" for="observaciones">Observaciones</label
                                                >
                                                <textarea
                                                        class="form-control"
                                                        name="observaciones"
                                                        id="observaciones"
                                                        maxlength="200"
                                                        rows="4"
                                                        placeholder="Opcional, maximo 200 caracteres, estas podran ser vistas por el cliente..."
                                                ></textarea>
                                                <div class="invalid-feedback">
                                                    Debes llenar este campo
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label class="fw-bold" for="tipo_elemento"
                                                >Tipo de elemento</label
                                                >
                                                <select
                                                        class="form-select"
                                                        id="tipo_elemento"
                                                        name="tipo_elemento"
                                                        required
                                                >
                                                    <option selected disabled value="">
                                                        Eligir...
                                                    </option>
                                                    <option value="Servicio" id="servicio">
                                                        Servicio
                                                    </option>
                                                    <option value="Producto" id="producto">
                                                        Producto
                                                    </option>
                                                </select>
                                                <div class="invalid-feedback">
                                                    Elija un tipo de elemento antes de enviar...
                                                </div>
                                            </div>
                                            <div class="col">
                                                <label class="fw-bold" for="id_elemento"
                                                >ID elemento</label
                                                >
                                                <input
                                                        type="text"
                                                        name="id_elemento"
                                                        id="id_elemento"
                                                        pattern="[0-9]+"
                                                        maxlength="20"
                                                        class="form-control"
                                                        placeholder="Coloca un número entero ejemplo: 5 o 40"
                                                        required
                                                />
                                                <div class="invalid-feedback">
                                                    Debes llenar este campo con números enteros
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col-6">
                                                <label class="fw-bold" id="cantlbl" for="cantidad">Cantidad a
                                                    utilizar</label>
                                                <input
                                                        type="text"
                                                        name="cantidad"
                                                        id="cantidad"
                                                        pattern="[0-9]+"
                                                        maxlength="20"
                                                        class="form-control"
                                                        placeholder="Coloca un número entero ejemplo: 5 o 40"
                                                        required
                                                />
                                                <div class="invalid-feedback">
                                                    Debes llenar este campo con números enteros
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col-12 text-end">
                                                <button
                                                        class="btn btn-primary"
                                                        type="reset"
                                                        id="limpiar"
                                                >
                                                    Limpiar <span class="bi bi-eraser-fill"></span>
                                                </button>
                                                <button class="btn btn-success" type="submit">
                                                    Guardar <span class="ri-save-line"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col-12 card-header mb-2">
                                            Elementos del catálago
                                        </div>
                                        <div class="table-responsive text-nowrap">
                                            <table
                                                    class="table table-lg table-hover table-bordered"
                                                    id="tabla"
                                            >
                                                <thead class="thead">
                                                <th>
                                                    <span class="bi bi-key"></span> ID elemento
                                                </th>
                                                <th>Nombre</th>
                                                <th>Precio</th>
                                                <th>Descripción</th>
                                                <th class="tipo">Tipo de elemento</th>
                                                <th>Cantidad disponible</th>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="elemento" items="${elementos}" varStatus="status">

                                                    <tr>
                                                        <td class="idElemento">${elemento.id_elemento}</td>
                                                        <td><c:out value="${elemento.nombre}"/></td>
                                                        <td><c:out value="${elemento.descripcion}"/></td>
                                                        <td>${elemento.precio}</td>
                                                        <td><c:out value="${elemento.tipo_elemento}"/></td>
                                                        <td><c:out value="${elemento.cantidad}"/></td>

                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                Lista de elementos del catálogo que se incluyen en esta
                                revisión
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="table-responsive text-nowrap">
                                            <table
                                                    class="table table-lg table-hover table-bordered"
                                                    id="tabla2"
                                            >


                                                <thead class="thead">
                                                <th>
                                                    <span class="bi bi-key"></span> ID historial
                                                </th>
                                                <th>
                                                    <span class="bi bi-key"></span> ID elemento
                                                </th>
                                                <th>Nombre</th>
                                                <th>Precio individual</th>
                                                <th>Descripción</th>
                                                <th class="tipo">Tipo de elemento</th>
                                                <th>Cantidad utilizada</th>
                                                <th>Subtotal</th>
                                                <th class="nosort">Acciones</th>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="elm" items="${histCat}" varStatus="status">
                                                    <tr>
                                                        <td class="idHistorial">${elm.id_hist}</td>
                                                        <td>${elm.id_elemento}</td>
                                                        <td>${elm.nombre}</td>
                                                        <td>${elm.precioIndividual}</td>
                                                        <td>${elm.descripcion}</td>
                                                        <td class="serv">${elm.tipo_elemento}</td>
                                                        <td>${elm.cantidadUtilizada}</td>
                                                        <td>${elm.subtotal}</td>
                                                        <td>
                                                            <center>
                                                                <div class="editar_cant">
                                                                    <a
                                                                            href="modificarHistRev?id_hist=${elm.id_hist}"
                                                                            class="btn btn-warning btn-sm m-1"
                                                                    ><i class="bi bi-pencil-square"></i
                                                                    ></a>
                                                                </div>
                                                                <button class="btn btn-danger btn-sm m-1 eliminarHistorial"
                                                                        type="button"
                                                                        onclick="sweliminarHistorial('${elm.id_hist}','${control.id_rev}')">

                                                                    <i class="fa fa-trash-alt"></i>
                                                                </button>
                                                            </center>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div
                                                class="card-header mt-4 rounded thead text-end text-light fw-bold"
                                        >
                                            Total Actual: ${total}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="preloader"></div>
<a
        href="#"
        class="back-to-top d-flex align-items-center justify-content-center"
><i class="bi bi-arrow-up-short"></i
></a>

<script src="vistas/assets/js/eliminar_historial.js"></script>
<script src="vistas/assets/js/cambiarFase.js"></script>
<jsp:include page="../../plantillas/footer.jsp"></jsp:include>
<script>
    if (document.getElementById('observaciones') != null) {
        txtob = document.getElementById('observaciones');
        txtob.value = '${control.observaciones}';
    }
</script>
</body>
</html>

<%
        } else {
            response.sendRedirect("menu");
        }
    } catch (Exception e) {
        response.sendRedirect("menu");
    }
%>