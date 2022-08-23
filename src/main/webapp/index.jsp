<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("correo") != null) {
        //si sesion existe entonces enviar a menu
        response.sendRedirect("menu");
    }
%>

<!doctype html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ingreso</title>
    <!-- Favicons -->
    <link href="vistas/assets/img/logo.svg" rel="icon"/>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet"/>

    <!-- Vendor CSS Files -->
    <link href="vistas/assets/vendor/aos/aos.css" rel="stylesheet"/>
    <link href="vistas/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="vistas/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <link href="vistas/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <link href="vistas/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
    <link href="vistas/assets/vendor/remixicon/remixicon.css" rel="stylesheet"/>
    <link href="vistas/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>
    <link href="vistas/assets/vendor/sw/sw.css" rel="stylesheet"/>
    <link href="vistas/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"/>
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap5.min.css"/>

    <!-- Main CSS File -->
    <link href="vistas/assets/css/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="vistas/assets/css/show-password-toggle.css">

</head>

<body class="text-center h-100 mt-1">
<div class="container" data-aos="fade-up" data-aos-delay="200">
    <div class="row">
        <div class="col-12">
            <form class="text-left mx-auto card p-4 w-100 p-2 text-light needs-validation formsLogin" novalidate
                  action="ingresar" method="POST" autocomplete="on">
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
                <img class="mb-4 m-auto" src="vistas/assets/img/logo.svg" alt="" width="72" height="57">
                <h1 class="h3 mb-3 text-center  fw-bold">Bienvenido</h1>
                <label for="correo" class="text-left ml-0  fw-bold">Correo</label>
                <input type="email" name="correo" id="correo" class="form-control mb-3" required autofocus
                       placeholder="ejemplo@ejemplo.com"
                       onkeyup="this.value = this.value.toLowerCase();">
                <div class="invalid-feedback text-light mb-2 mt-0  fw-bold bg-danger rounded">
                    El formato del correo no es el corrrecto
                </div>
                <label for="password" class=" fw-bold">Contraseña</label>
                <div class="input-group">
                    <input type="password" id="password" name="current-password" autocomplete="current-password"
                           class="form-control rounded" spellcheck="false" autocorrect="off" autocapitalize="off"
                           required>
                    <div class="invalid-feedback text-light mb-2 mt-3  fw-bold bg-danger rounded">
                        Debe colocar su contraseña
                    </div>
                    <button id="toggle-password" type="button" class="d-none"
                            aria-label="Show password as plain text. Warning: this will display your password on the screen.">
                    </button>
                </div>
                <button class="btn btn-md btn-light btn-block mt-3 fw-bold sysbutton" type="submit">
                    Entrar
                </button>
                <label class="text-left ml-0 mt-3 fw-bold">ó</label>
                <a class="btn btn-md btn-light btn-block mt-3 fw-bold sysbutton" href="recuperar">¿Has olvidado
                    la contraseña?</a>
            </form>
        </div>
        <p class="my-5 text-center fw-bold">
            © 2022 | SEGA | Sistema Estructurado de Gestión Automotriz v1.0
        </p>
    </div>
</div>

<main id="main"></main>

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<script src="vistas/assets/js/eliminar_elemento.js"></script>

<!-- JS Files -->
<script src="vistas/assets/js/forms.js"></script>
<script src="vistas/assets/vendor/purecounter/purecounter.js"></script>
<script src="vistas/assets/vendor/aos/aos.js"></script>
<script src="vistas/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vistas/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="vistas/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="vistas/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="vistas/assets/vendor/sw/sw.js"></script>
<script src="vistas/assets/vendor/iconify/iconify.js"></script>

<!-- Datatable js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap5.min.js"></script>
<script src="vistas/assets/js/tablas.js"></script>

<!-- Template Main JS File -->
<script src="vistas/assets/js/main.js"></script>
<script src="vistas/assets/js/show-password-toggle.js" async></script>
</body>

</html>