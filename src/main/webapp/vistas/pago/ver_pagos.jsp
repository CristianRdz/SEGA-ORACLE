<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try {
        if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1")
                || session.getAttribute("rol").toString().equals("2")
                || session.getAttribute("rol").toString().equals("4")) {
%> <%-- Verificar que la sesión existe--%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>Visualizar Pagos</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>

<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">
    <div
            class="container container-cars position-relative"
            data-aos="fade-up"
            data-aos-delay="100"
    >
        <div class="row icon-boxes">
            <c:choose>
                <c:when test="${not empty pagos}">
                </c:when>
                <c:otherwise>
                    <p class="mt-5 p-5 text-center fw-bold">
                        No hay pagos aún...
                    </p>
                </c:otherwise>
            </c:choose>
            <c:forEach var="pago" items="${pagos}" varStatus="status">
                <div class="icon-box mb-5 mt-5 mb-lg-0">
                    <div class="d-flex flex-column align-items-start text-center">
                        <div class="icon"><i class="bi bi-cash-coin"></i></div>
                    </div>
                    <h4 class="title text-end">${pago.cantidad} M.N</h4>
                    <div class="description">
                        Detalles:
                        <hr class="my-4"/>
                        <ul class="list-group list-group-flush">
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                    <span
                            class="iconify"
                            data-icon="radix-icons:id-card"
                    ></span>
                                    ID Pago:
                                </h6>
                                <span class="text-secondary">${pago.id_pago}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="bi bi-calendar-date"></span> Ultimo movimiento:
                                </h6>
                                <span class="text-secondary">${pago.fecha_realizacion} </span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="fa fa-money-check-alt"></span> Estado del pago:
                                </h6>
                                <span class="text-secondary edo_pago">${pago.estado_pago}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="iconify" data-icon="radix-icons:id-card"></span> ID Revisión asociada a
                                    este pago:
                                </h6>
                                <span class="text-secondary">${pago.id_revision}</span>
                            </li>

                            <li
                                    class="list-group-item d-flex justify-content-center align-items-center flex-wrap"
                            >
                                <c:choose>
                                    <c:when test="${sessionScope.rol == '1' || sessionScope.rol== '4'}">
                                        <button
                                                type="button"
                                                class="btn btn-primary btn-sm aprobar"
                                                onclick="swAccionarPago('${pago.id_revision}','${pago.id_pago}')">
                                            Aprobar pago <span class="fa fa-check"></span>
                                        </button>
                                    <div class="botonpago"></div>
                                    </c:when>
                                    <c:when test="${sessionScope.rol == '2'}">
                                        <div class="botonpago">
                                            <a href="verDetallesPago?id_rev=${pago.id_revision}&id_pago=${pago.id_pago}"
                                               class="btn btn-success btn-sm m-1"
                                            >Pagar <i class="fa fa-arrow-circle-right"></i
                                            ></a></div>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- End Hero -->

<main id="main"></main>

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