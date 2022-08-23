<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("correo") != null) {
%> <%-- Verificar que la sesión existe--%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>Menú</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>

<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>

<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">
    <div
            class="container position-relative"
            data-aos="fade-up"
            data-aos-delay="100"
    >
        <div class="row icon-boxes">
            <%
                 String rol = session.getAttribute("rol").toString();
                switch(rol){
                    case "1":
            %>
                <div
                        class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0"
                        data-aos="zoom-in"
                        data-aos-delay="200"
                >
                    <div class="icon-box">
                        <div class="icon">
                            <i class="bi bi-file-earmark-person-fill"></i>
                        </div>
                        <h4 class="title"><a href="gestionUsuarios">Gestionar Usuarios</a></h4>
                        <p class="description">
                            Esta opción del menú le permite crear, modificar y eliminar usuarios.
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                     data-aos-delay="200">
                    <div class="icon-box">
                        <div class="icon"><i class="ri-car-line"></i></div>
                        <h4 class="title"><a href="gestionAutos">Gestionar Autos</a></h4>
                        <p class="description">
                            Esta opción del menú le permite crear, modificar y eliminar autos.
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                     data-aos-delay="200">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-box-seam"></i></div>
                        <h4 class="title"><a href="gestionCatalogo">Gestionar Catálogo</a></h4>
                        <p class="description">
                            Esta opción del menú le permite crear, modificar y eliminar productos y servicios.
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                     data-aos-delay="200">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-tools"></i></div>
                        <h4 class="title"><a href="gestionRevisiones">Gestionar Revisión</a></h4>
                        <p class="description">
                            Esta opción del menú le permite crear, modificar y eliminar revisiones.
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                     data-aos-delay="200">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="bi bi-tools"></i><i class="bi bi-x"></i>
                        </div>
                        <h4 class="title">
                            <a href="cancelarRevision">Cancelar Revisión</a>
                        </h4>
                        <p class="description">
                            Esta opción del menú le permite cancelar una revisión la cual solo ha sido ingresada.
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                     data-aos-delay="200">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-cash-coin"></i></div>
                        <h4 class="title"><a href="verPagos">Visualizar Pagos</a></h4>
                        <p class="description">
                            Esta opción del menú le visualizar los pagos pendientes.
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                     data-aos-delay="200">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="ri-car-line"></i> <i class="bi bi-eye"></i>
                        </div>
                        <h4 class="title"><a href="verAutos">Visualizar autos</a></h4>
                        <p class="description">
                            Esta opción del menú le permite ver los autos que son de su propiedad.
                        </p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                     data-aos-delay="400">
                    <div class="icon-box">
                        <div class="icon"><i class="bi bi-clock-history"></i></div>
                        <h4 class="title"><a href="verHistorial">Historial de Revisión</a></h4>
                        <p class="description">
                            Esta opción del menú le permite visualizar el historial y estado de sus revisiones.
                        </p>
                    </div>
                </div>
            <%
                        break;
                case "2":
            %>


            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="200">
                <div class="icon-box">
                    <div class="icon">
                        <i class="ri-car-line"></i> <i class="bi bi-eye"></i>
                    </div>
                    <h4 class="title"><a href="verAutos">Visualizar autos</a></h4>
                    <p class="description">
                        Esta opción del menú le permite ver los autos que son de su propiedad.
                    </p>
                </div>
            </div>


            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="400">
                <div class="icon-box">
                    <div class="icon"><i class="bi bi-clock-history"></i></div>
                    <h4 class="title"><a href="verHistorial">Historial de Revisión</a></h4>
                    <p class="description">
                        Esta opción del menú le permite visualizar el historial y estado de sus revisiones.
                    </p>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="200">
                <div class="icon-box">
                    <div class="icon"><i class="bi bi-cash-coin"></i></div>
                    <h4 class="title"><a href="verPagos">Visualizar Pagos</a></h4>
                    <p class="description">
                        Esta opción del menú le visualizar sus pagos pendientes.
                    </p>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="200">
                <div class="icon-box">
                    <div class="icon">
                        <i class="bi bi-tools"></i><i class="bi bi-x"></i>
                    </div>
                    <h4 class="title">
                        <a href="cancelarRevision">Cancelar Revisión</a>
                    </h4>
                    <p class="description">
                        Esta opción del menú le permite cancelar una revisión la cual solo ha sido ingresada.
                    </p>
                </div>
            </div>

            <%
                    break;
                case "3":
            %>

            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="200">

                <div class="icon-box">
                    <div class="icon">
                        <i class="bi bi-file-earmark-person-fill"></i>
                    </div>
                    <h4 class="title"><a href="gestionUsuarios">Gestionar Usuarios</a></h4>
                    <p class="description">
                        Esta opción del menú le permite crear, modificar y eliminar usuarios.
                    </p>
                </div>
            </div>

            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="200">
                <div class="icon-box">
                    <div class="icon"><i class="ri-car-line"></i></div>
                    <h4 class="title"><a href="gestionAutos">Gestionar Autos</a></h4>
                    <p class="description">
                        Esta opción del menú le permite crear, modificar y eliminar autos.
                    </p>
                </div>
            </div>

            <%
                    break;
                case "4":
            %>
            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="200">
                <div class="icon-box">
                    <div class="icon"><i class="bi bi-cash-coin"></i></div>
                    <h4 class="title"><a href="verPagos">Visualizar Pagos</a></h4>
                    <p class="description">
                        Esta opción del menú le visualizar los pagos pendientes.
                    </p>
                </div>
            </div>
            <%
                    break;
                case "5":
            %>

            <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mt-5 mb-lg-0" data-aos="zoom-in"
                 data-aos-delay="200">
                <div class="icon-box">
                    <div class="icon"><i class="bi bi-tools"></i></div>
                    <h4 class="title"><a href="gestionRevisiones">Gestionar Revisión</a></h4>
                    <p class="description">
                        Esta opción del menú le permite crear y modificar revisiones.
                    </p>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>
<!-- End Hero -->
</div>
<p class="mt-5 text-center fw-bold">
    © 2022 | SEGA | Sistema Estructurado de Gestión Automotriz v1.0
</p>
</div>

<main id="main"></main>

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i
></a>
<jsp:include page="../../plantillas/footer.jsp"></jsp:include>
</body>
</html>
<%
    } else {
        response.sendRedirect("ingreso");
    }
%>