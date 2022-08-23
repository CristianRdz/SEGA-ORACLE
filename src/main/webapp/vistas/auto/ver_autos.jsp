<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try {
        if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1") || session.getAttribute("rol").toString().equals("2")) {
%> <%-- Verificar que la sesión existe--%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>Visualizar autos</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>

<section id="hero" class="d-flex align-items-center">
    <div
            class="container container-cars position-relative"
            data-aos="fade-up"
            data-aos-delay="100"
    >
        <div class="row icon-boxes">
            <c:choose>
                <c:when test="${not empty autos}">
                </c:when>
                <c:otherwise>
                    <p class="mt-5 p-5 text-center fw-bold">
                        No tienes autos aún...
                    </p>
                </c:otherwise>
            </c:choose>
            <c:forEach var="auto" items="${autos}" varStatus="status">

                <div class="icon-box mb-5 mt-5 mb-lg-0">
                    <div class="d-flex flex-column align-items-center text-center">
                        <img
                                src="vistas/assets/img/auto.png"
                                alt="fase"
                                class="p-1 bg-transparent"
                                width="110"
                        />
                    </div>
                    <h4 class="title">${auto.marca} ${auto.modelo}</h4>
                    <div class="description">
                        Detalles:
                        <hr class="my-4"/>
                        <ul class="list-group list-group-flush">
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="fa fa-credit-card"></span> Matrícula:
                                </h6>
                                <span class="text-secondary">${auto.matricula}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="fa fa-barcode"></span> Número de identificación
                                    vehicular (NIV):
                                </h6>
                                <span class="text-secondary">${auto.n_serie}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="bi bi-card-text"></span> Número de Constancia
                                    de Inscripción (NCI):
                                </h6>
                                <span class="text-secondary">${auto.n_constancia}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="bi bi-paint-bucket"></span> Color:
                                </h6>
                                <span class="text-secondary">${auto.color}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="fa fa-oil-can"></span> Tipo de combustible:
                                </h6>
                                <span class="text-secondary">${auto.tipo_combustible}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="iconify" data-icon="tabler:engine"></span> Tipo
                                    de transmición:
                                </h6>
                                <span class="text-secondary">${auto.tipo_transmision}</span>
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
<a
        href="#"
        class="back-to-top d-flex align-items-center justify-content-center"
><i class="bi bi-arrow-up-short"></i
></a>

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