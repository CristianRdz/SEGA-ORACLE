<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("correo") != null) {
        //si sesion existe entonces enviar a menu
        response.sendRedirect("menu");
    }
    if (session.getAttribute("id_recu") != null) {
%> <%-- Verificar que la sesión existe--%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Recuperar</title>
    <!-- Favicons -->
    <link href="vistas/assets/img/logo.svg" rel="icon" />

    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="vistas/assets/vendor/aos/aos.css" rel="stylesheet" />
    <link
            href="vistas/assets/vendor/bootstrap/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="vistas/assets/vendor/bootstrap-icons/bootstrap-icons.css"
            rel="stylesheet"
    />
    <link href="vistas/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link
            href="vistas/assets/vendor/glightbox/css/glightbox.min.css"
            rel="stylesheet"
    />
    <link href="vistas/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="vistas/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Main CSS File -->
    <link href="vistas/assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="vistas/assets/css/show-password-toggle.css" />
</head>

<body class="text-center h-100 mt-1">
<div class="container" data-aos="fade-up" data-aos-delay="200">
    <div class="row">
        <div class="col-12">
            <form
                    class="text-left mx-auto card p-4 w-100 p-2 text-light needs-validation formsLogin"
                    novalidate
                    action="validarCodigo"
                    method="POST"
                    autocomplete="off"
            >
                <c:choose>
                    <c:when test="${param['result']}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <c:out value="${param['message']}"></c:out>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:when>
                    <c:when test="${param['result']==false}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <c:out value="${param['message']}"></c:out>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
                <img
                        class="mb-4 m-auto"
                        src="vistas/assets/img/logo.svg"
                        alt=""
                        width="72"
                        height="57"
                />
                <h4 class="mb-3 text-center fw-bold">Recupera tu cuenta</h4>
                <label for="codigo" class="text-left ml-0 fw-bold mb-2"
                >Ingresa tu código de recuperación</label
                >
                <input
                        type="text"
                        name="codigo"
                        id="codigo"
                        class="form-control mb-3"
                        required
                        autofocus
                        placeholder="12345..."
                        pattern="[0-9]+"
                        maxlength="5"
                        minlength="5"
                />
                <div
                        class="invalid-feedback text-light mb-2 mt-0 fw-bold bg-danger rounded"
                >
                    El código solamente contiene 5 numeros  enteros
                </div>
                <button
                        class="btn btn-md btn-light btn-block mt-3 fw-bold sysbutton"
                        type="submit"
                >
                    Enviar
                </button>
                <label class="text-left ml-0 mt-3 fw-bold">ó</label>
                <a
                        class="btn btn-md btn-light btn-block mt-3 fw-bold sysbutton"
                        href="ingreso"
                >Cancelar</a
                >
            </form>
        </div>
    </div>
    <p class="mt-5 text-center fw-bold">
        © 2022 | SEGA | Sistema Estructurado de Gestión Automotriz v1.0
    </p>
</div>

<main id="main"></main>

<div id="preloader"></div>
<a
        href="#"
        class="back-to-top d-flex align-items-center justify-content-center"
><i class="bi bi-arrow-up-short"></i
></a>

<!-- JS Files -->
<script src="vistas/assets/js/forms.js"></script>
<script src="vistas/assets/vendor/purecounter/purecounter.js"></script>
<script src="vistas/assets/vendor/aos/aos.js"></script>
<script src="vistas/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vistas/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="vistas/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="vistas/assets/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Main JS File -->
<script src="vistas/assets/js/main.js"></script>
</body>
</html>
<%
    } else {
        response.sendRedirect("ingreso");
    }
%>