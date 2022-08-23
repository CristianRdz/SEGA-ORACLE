<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  try {
    if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1") || session.getAttribute("rol").toString().equals("5")) {
%> <%-- Verificar que la sesión existe--%>
<c:choose>
  <c:when test="${not empty revision || not empty id_hist}">
  </c:when>
  <c:otherwise>
    <c:redirect url="gestionRevisiones"/>
  </c:otherwise>
</c:choose>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Modificación de revisión</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>
    <div class="container mb-5 mt-5 p-5" data-aos="fade-up" data-aos-delay="100">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">Modificación de revisión</div>
            <div class="card-body">
              <div class="row">
                <div class="col-12">
                  <form
                    class="needs-validation"
                    novalidate
                    action="actualizarRevision"
                    method="POST"
                    autocomplete="off"
                  >
                    <input hidden type="hidden" name="id_rev" id="id_rev" value="${revision.id_rev}"/>
                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col-6">
                          <label class="fw-bold" for="fase"
                            >Fase de revisión</label
                          >
                          <select
                            class="form-select"
                            id="fase"
                            name="fase"
                            required
                          >
                            <option disabled value="">Eligir...</option>
                            <option selected value="${revision.fase}">
                              Guardado - ${revision.fase}
                            </option>
                            <option value="Ingreso">Ingreso</option>
                            <option value="Inspección y realización">
                              Inspección y realización
                            </option>
                            <option value="En pruebas">En pruebas</option>
                            <option value="Salida del taller">
                              Salida del taller
                            </option>
                            <option value="Finalizado">Finalizado</option>
                            <option value="Cancelado">Cancelado</option>
                          </select>
                          <div class="invalid-feedback">
                            Elija un tipo de fase antes de enviar...
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <label class="fw-bold" for="observaciones"
                            >Observaciones</label
                          >
                          <textarea
                            class="form-control"
                            required
                            name="observaciones"
                            id="observaciones"
                            maxlength="200"
                            rows="4"
                            placeholder="Opcional, máximo 200 caracteres, estas podrán ser vistas por el cliente..."
                          ></textarea>
                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col-12 text-end">
                          <a
                            href="gestionRevisiones"
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
<script>
  if (document.getElementById('observaciones') != null) {
    txtob = document.getElementById('observaciones');
    txtob.value = '${revision.observaciones}';
  }
</script>
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