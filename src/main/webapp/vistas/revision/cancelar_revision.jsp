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
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Cancelar revisión</title>
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
            <div class="card-header">Cancelar revisión</div>
            <div class="card-body">
              <div class="row">
                <div class="col-12">
                  <form
                    class="needs-validation"
                    novalidate
                    action="revCancelada"
                    method="POST"
                    autocomplete="off"
                  >
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
                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <label class="fw-bold" for="id_rev"
                            >ID revisión</label
                          >
                          <input
                            type="text"
                            required
                            name="id_rev"
                            id="id_rev"
                            pattern="[0-9]+"
                            maxlength="20"
                            class="form-control"
                            placeholder="323..."
                            value="${revisiones.id_rev}"
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
                          <button class="btn btn-primary" type="reset">
                            Limpiar <span class="bi bi-eraser-fill"></span>
                          </button>
                          <a
                            href="menu"
                            class="btn btn-danger"
                            >Cancelar <span class="bi bi-x-lg"></span
                          ></a>
                        <button class="btn btn-success" type="submit">
                            Registrar <span class="bi bi-check-lg"></span>
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