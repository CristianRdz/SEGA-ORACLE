<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try {
        if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1") || session.getAttribute("rol").toString().equals("5")) {
%> <%-- Verificar que la sesión existe--%>
<c:choose>
    <c:when test="${not empty hist || not empty id_hist}">
    </c:when>
    <c:otherwise>
        <c:redirect url="gestionRevisiones"/>
    </c:otherwise>
</c:choose>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>Modificar historial</title>
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
                <div class="card-header">Modificar historial</div>
                <div class="card-body">
                    <div class="row">
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
                            <form
                                    class="needs-validation"
                                    novalidate
                                    action="actualizarHistRev"
                                    method="POST"
                                    autocomplete="off"
                            >
                                <input type="hidden" id="id_rev" name="id_rev" value="${hist.id_rev}">
                                <input type="hidden" id="id_hist" name="id_hist" value="${hist.id_hist}">
                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col">
                                            <label class="fw-bold" for="cantidad"
                                            >Cantidad Utilizada</label
                                            >
                                            <input
                                                    type="text"
                                                    required
                                                    name="cantidad"
                                                    id="cantidad"
                                                    pattern="[0-9]+"
                                                    maxlength="20"
                                                    class="form-control"
                                                    placeholder="323..."
                                                    value="${hist.cantidadUtilizada}"
                                            />
                                            <div class="invalid-feedback">
                                                Debe llenar este campo con números enteros
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col-12 text-end">
                                            <a
                                                    href="controlRevision?id=${hist.id_rev}"
                                                    class="btn btn-danger"
                                            >Cancelar <span class="bi bi-x-lg"></span
                                            ></a>
                                            <button class="btn btn-warning" type="submit">
                                                Modificar <span class="bi bi-check-lg"></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
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