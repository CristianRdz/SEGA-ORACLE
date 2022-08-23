<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  try {
    if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1")) {
%> <%-- Verificar que la sesión existe--%>

<c:choose>
  <c:when test="${not empty elementos || not empty id}">
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

    <title>Modificación de elementos del catálago</title>
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
            <div class="card-header">Modificación de elementos del catálago</div>
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
                    action="actualizarElemento"
                    method="POST"
                    autocomplete="off"
                  >
                    <input type="hidden" name="id_elemento" id="id_elemento" value="${elementos.id_elemento}" />
                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <label class="fw-bold" for="nombre">Nombre</label>
                          <input
                            type="text"
                            required
                            name="nombre"
                            id="nombre"
                            maxlength="50"
                            class="form-control"
                            placeholder="..."
                            value="${elementos.nombre}"
                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>
                        </div>
                        <div class="col">
                          <label class="fw-bold" for="precio">Precio</label>
                          <input
                            type="text"
                            required
                            name="precio"
                            id="precio"
                            pattern="^[0-9]+([\.][0-9]{1,2})?$"
                            maxlength="22"
                            class="form-control"
                            placeholder="2500.90 o 3000"
                            value="${elementos.precio}"

                          />
                          <div class="invalid-feedback">
                            Debe llenar este campo con números enteros de 2
                            decimales
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <label class="fw-bold" for="descripcion"
                            >Descripción</label
                          >
                          <textarea
                            class="form-control"
                            required
                            name="descripcion"
                            id="descripcion"
                            maxlength="200"
                            rows="4"
                            placeholder="Breve descripción de maximo 200 caracteres..."

                          ></textarea>
                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>
                        </div>
                      </div>
                    </div>

                      <input hidden name="tipo_elemento" id="tipo_elemento" value="${elementos.tipo_elemento}" />

                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <label class="fw-bold" id="cantlbl" for="cantidad">Cantidad</label>
                          <input
                            type="text"
                            name="cantidad"
                            id="cantidad"
                            pattern="[0-9]+"
                            maxlength="20"
                            class="form-control"
                            placeholder="Coloca un número entero ejemplo: 5 o 40"
                            value="${elementos.cantidad}"
                            required
                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo con números enteros
                          </div>
                        </div>
                        <div class="col">
                          <select
                            class="form-select"
                            id="tipo_elemento_saved"
                            name="tipo_elemento_saved"
                            required
                            hidden
                            
                          >
                            <option disabled value="">Eligir...</option>
                            <option value="${elementos.tipo_elemento}" id="servicio" selected>
                              Guardada
                            </option>
                          </select>
                          <div class="invalid-feedback">
                            Elija un tipo de elemento antes de enviar...
                          </div>
                        </div>
                        
                      </div>
                    </div>

                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col-12 text-end">
                          <a
                            href="gestionCatalogo"
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
    if (document.getElementById('descripcion') != null) {
        txtob = document.getElementById('descripcion');
        txtob.value = '${elementos.descripcion}';
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