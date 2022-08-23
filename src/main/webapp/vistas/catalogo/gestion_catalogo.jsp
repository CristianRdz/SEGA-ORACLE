<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try {
        if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1")) {
%> <%-- Verificar que la sesión existe--%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Gestionar catálogo</title>
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
            <div class="card-header">
              <div class="row">
                <div class="col-6">Gestionar catálogo</div>
                <div class="col-6 text-end">
                  <a
                    href="registrarElemento"
                    class="btn btn-outline-primary btn-sm"
                  >
                    Registrar elemento
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
                <div class="table-responsive text-nowrap">
                    <table class="table table-lg table-hover table-bordered" id="tabla">
                        <thead class="thead">
                            <th><span class="bi bi-key"></span> ID elemento</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th class="tipo">Tipo de elemento</th>
                            <th>Cantidad disponible</th>
                            <th class="nosort">Acciones</th>
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
                            <td>
                                    <center>

                                        <a href="modificarElemento?id=${elemento.id_elemento}" class="btn btn-warning btn-sm m-1"><i class="bi bi-pencil-square"></i
                                        ></a>
                                        <button class="btn btn-danger btn-sm m-1 eliminarElemento"
                                                type="button" onclick="sweliminarElemento('${elemento.id_elemento}')">
                              <i class="fa fa-trash-alt"></i>
                                        </button>
                                    </center>
                                </td>
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
        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i
    ></a>

<script src="vistas/assets/js/eliminar_elemento.js"></script>
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