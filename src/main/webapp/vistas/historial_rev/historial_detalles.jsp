<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try {
        if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1")
                || session.getAttribute("rol").toString().equals("2")) {
%>
<c:choose>
    <c:when test="${not empty control}">
    </c:when>
    <c:otherwise>
        <c:redirect url="verHistorial"/>
    </c:otherwise>
</c:choose>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Detalles de revisión</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>
<div
        class="container mb-5 mt-5 p-5"
        data-aos="fade-up"
        data-aos-delay="100"
>
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
                                    alt="fase"
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
                                <a href="verHistorial" class="btn btn-primary btn-sm m-1"
                                >Ir a pantalla de historial <i class="bi bi-x-lg"></i
                                ></a>
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
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                Lista de elementos del catálogo que se incluyen en esta revisión
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group mb-3">
                                            <div class="row">
                                                <div class="col">
                                                    <label class="fw-bold" for="observaciones">Observaciones</label
                                                    >
                                                    <textarea
                                                            class="form-control"
                                                            name="observaciones"
                                                            id="observaciones"
                                                            maxlength="200"
                                                            rows="4"
                                                            readonly
                                                    ></textarea>
                                                    <div class="invalid-feedback">
                                                        Debes llenar este campo
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="table-responsive text-nowrap">
                                            <table class="table table-lg table-hover table-bordered" id="tabla2">
                                                <thead class="thead">
                                                <th>
                                                    <span class="bi bi-key"></span> ID elemento
                                                </th>
                                                <th>Nombre</th>
                                                <th>Precio individual</th>
                                                <th>Descripción</th>
                                                <th class="tipo">Tipo de elemento</th>
                                                <th>Cantidad utilizada</th>
                                                <th>Subtotal</th>
                                                </thead>
                                                <tbody>

                                                <c:forEach var="elm" items="${histCat}" varStatus="status">
                                                    <tr>

                                                        <td>${elm.id_elemento}</td>
                                                        <td>${elm.nombre}</td>
                                                        <td>${elm.precioIndividual}</td>
                                                        <td>${elm.descripcion}</td>
                                                        <td>${elm.tipo_elemento}</td>
                                                        <td>${elm.cantidadUtilizada}</td>
                                                        <td>${elm.subtotal}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="card-header mt-4 rounded thead text-end text-light fw-bold">
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
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i
></a>
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