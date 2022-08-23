<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try {
        if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("2")) {
%> <%-- Verificar que la sesión existe--%>
<c:choose>
    <c:when test="${not empty control || not empty id_rev}">
    </c:when>
    <c:otherwise>
        <c:redirect url="verPagos"/>
    </c:otherwise>
</c:choose>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>Detalles del pago</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>
<div
        class="container mb-5 mt-5 p-5"
        data-aos="fade-up"
        data-aos-delay="100"
>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">¿Qué estoy pagando?</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
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
                            <div class="card-header mb-4">Métodos de pago</div>
                            <div class="row">
                                <div class="col-12 text-center mb-4">
                                    <select
                                            class="form-select"
                                            id="forma_pago"
                                            name="forma_pago"
                                            autocomplete="off"
                                            required
                                    >
                                        <option selected disabled value="">Eligir...</option>
                                        <option value="Efectivo" id="efectivopc">
                                            Efectivo
                                        </option>
                                        <option value="Tarjeta" id="tarjetaopc">Tarjeta</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div id="cont_pago" hidden>
                                        <div class="row">
                                            <div class="col-12 text-end">
                                                <button class="btn btn-success pagar" type="button"
                                                        onclick="swAccionarPago('${id_rev}','${id_pago}')">
                                                    Pagar
                                                    <span class="fa fa-arrow-circle-right"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tarjeta" hidden>
                                        <div class="row">
                                        <div class="col-12">
                                            <p>EL pago se recibirá en la terminal del taller</p>
                                            <div class="col-12 text-end">
                                                <button class="btn btn-success pagar" type="button"
                                                        onclick="swAccionarPago('${id_rev}','${id_pago}')">
                                                    Pagar
                                                    <span class="fa fa-arrow-circle-right"></span>
                                                </button>
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
    </div>
</div>
<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i
></a>
<script src="vistas/assets/js/accionPago.js"></script>
<jsp:include page="../../plantillas/footer.jsp"></jsp:include>
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