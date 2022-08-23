<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try {
        if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1") || session.getAttribute("rol").toString().equals("3")) {
%> <%-- Verificar que la sesión existe--%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>Gestionar usuarios</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>

<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>

<div class="container mb-5 mt-5 p-5" data-aos="fade-up" data-aos-delay="100">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-6">Gestionar usuarios</div>
                        <div class="col-6 text-end">
                            <a
                                    href="registrarUsuario"
                                    class="btn btn-outline-primary btn-sm"
                            >
                                Registrar usuario
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
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
                        <% if (session.getAttribute("rol").toString().equals("3")) {%>
                        <div class="table-responsive text-nowrap">
                            <table class="table table-lg table-hover table-bordered">
                                <thead class="thead">
                                <th><span class="bi bi-key"></span> ID</th>
                                <th>Nombre</th>
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th><span class="bi bi-key"></span> Correo</th>
                                <th>CURP</th>
                                <th>Teléfono</th>
                                <th><span class="bi bi-key"></span> RFC</th>
                                <th class="rol">Rol</th>
                                <th class="nosort">Acciones</th>
                                </thead>
                                <tbody>
                                <c:forEach var="usuario" items="${usuarios}" varStatus="status">
                                    <c:if test="${usuario.rol == '2'}">
                                        <tr>
                                            <td class="idUsuario"><c:out value="${usuario.id_usuario}"/></td>
                                            <td><c:out value="${usuario.nombre}"/></td>
                                            <td><c:out value="${usuario.apellido_paterno}"/></td>
                                            <td><c:out value="${usuario.apellido_materno}"/></td>
                                            <td><c:out value="${usuario.correo}"/></td>
                                            <td><c:out value="${usuario.curp}"/></td>
                                            <td><c:out value="${usuario.telefono}"/></td>
                                            <td><c:out value="${usuario.rfc}"/></td>
                                            <td><c:out value="${usuario.rol}"/></td>
                                            <td>
                                                <center>
                                                    <a href="modificarUsuario?id=${usuario.correo}"
                                                       class="btn btn-warning btn-sm m-1"><i
                                                            class="bi bi-pencil-square"></i
                                                    ></a>
                                                    <button onclick="sweliminarUsuario('${usuario.id_usuario}')" class="btn btn-danger btn-sm m-1 eliminarUsuario"
                                                            type="button">
                                                        <i class="fa fa-trash-alt"></i>
                                                    </button>
                                                </center>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div
                        <%} else {%>
                        <div class="table-responsive text-nowrap">
                            <table class="table table-lg table-hover table-bordered">
                                <thead class="thead">
                                <th><span class="bi bi-key"></span> ID</th>
                                <th>Nombre</th>
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th><span class="bi bi-key"></span> Correo</th>
                                <th>CURP</th>
                                <th>Teléfono</th>
                                <th><span class="bi bi-key"></span> RFC</th>
                                <th>Calle</th>
                                <th>Estado</th>
                                <th>Colonia</th>
                                <th>Referencias</th>
                                <th>Municipio</th>
                                <th>Código postal</th>
                                <th class="rol">Rol</th>
                                <th class="nosort">Acciones</th>
                                </thead>
                                <tbody>
                                <c:forEach var="usuario" items="${usuarios}" varStatus="status">
                                    <tr>
                                        <td class="idUsuario"><c:out value="${usuario.id_usuario}"/></td>
                                        <td><c:out value="${usuario.nombre}"/></td>
                                        <td><c:out value="${usuario.apellido_paterno}"/></td>
                                        <td><c:out value="${usuario.apellido_materno}"/></td>
                                        <td><c:out value="${usuario.correo}"/></td>
                                        <td><c:out value="${usuario.curp}"/></td>
                                        <td><c:out value="${usuario.telefono}"/></td>
                                        <td><c:out value="${usuario.rfc}"/></td>
                                        <td><c:out value="${usuario.calle}"/></td>
                                        <td><c:out value="${usuario.estado}"/></td>
                                        <td><c:out value="${usuario.colonia}"/></td>
                                        <td><c:out value="${usuario.referencias}"/></td>
                                        <td><c:out value="${usuario.municipio}"/></td>
                                        <td><c:out value="${usuario.codigoPostal}"/></td>
                                        <td><c:out value="${usuario.rol}"/></td>
                                        <td>
                                            <center>
                                                <a href="modificarUsuario?id=${usuario.correo}"
                                                   class="btn btn-warning btn-sm m-1"><i
                                                        class="bi bi-pencil-square"></i
                                                ></a>
                                                <button onclick="sweliminarUsuario('${usuario.id_usuario}')" class="btn btn-danger btn-sm m-1 eliminarUsuario"
                                                        type="button">
                                                    <i class="fa fa-trash-alt"></i>
                                                </button>
                                            </center>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div

                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i
></a>

<script src="vistas/assets/js/eliminar_usuario.js"></script>
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