<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try {
        if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1") || session.getAttribute("rol").toString().equals("5")) {
%> <%-- Verificar que la sesión existe--%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Gestionar revisión</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>
    <div class="container mt-5 p-5" data-aos="fade-up" data-aos-delay="100">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <div class="row">
                <div class="col-6">Gestionar revisión</div>
                <div class="col-6 text-end">
                  <a
                    href="registrarRevision"
                    class="btn btn-outline-primary btn-sm"
                  >
                    Registrar revisión
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
                <div class="table-responsive">
                    <table class="table table-lg table-hover table-bordered" id="tabla">
                        <thead class="thead">
                            <th><span class="bi bi-key"></span> ID Revisión</th>
                            <th class="fase">Fase de Revisión</th>
                            <th>Observaciones</th>
                            <th>Último movimiento</th>
                            <th>
                                <span class="bi bi-key"></span> Matrícula receptor
                            </th>
                            <th><span class="bi bi-key"></span> ID Mecánico</th>
                            <th class="nosort">Acciones</th>
                        </thead>
                        <tbody>
                        <c:forEach var="revision" items="${revisiones}" varStatus="status">
                            <tr>
                                <td class="idRevision">${revision.id_rev}</td>
                                <td class="fstbl">${revision.fase}</td>
                                <td>
                                        ${revision.observaciones}
                                </td>
                                <td>${revision.fecha_ult_mov}</td>
                                <td>${revision.martricula_auto}</td>
                                <td>${revision.id_mecanico}</td>
                                <td>
                                    <center>
                                        <div class="control">
                                            <a href="controlRevision?id=${revision.id_rev}" class="btn btn-primary btn-sm m-1"><i class="bi bi-tools"></i
                              ></a>
                                        </div>

                                        <a href="modificarRevision?id=${revision.id_rev}" class="btn btn-warning btn-sm m-1"><i class="bi bi-pencil-square"></i
                            ></a>
                                        <button class="btn btn-danger btn-sm m-1 eliminarRevision"
                                                type="button" onclick="sweliminarRevision('${revision.id_rev}')">
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

        <script src="vistas/assets/js/eliminar_revisión.js"></script>
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