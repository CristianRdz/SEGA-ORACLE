<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  try{
    if (session.getAttribute("correo") != null  && session.getAttribute("rol").toString().equals("1") || session.getAttribute("rol").toString().equals("3")) {
%> <%-- Verificar que la sesión existe--%>
<c:if test="${sessionScope.rol == '3' && usuario.rol!='2'}" >
  <c:redirect url = "gestionUsuarios"/>
</c:if><%-- si un asistente intenta modificar un usuario no cliente volver a gestion--%>
<c:choose>
  <c:when test="${not empty usuario || not empty id}">
  </c:when>
  <c:otherwise>
    <c:redirect url="gestionUsuarios"/>
  </c:otherwise>
</c:choose>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Modificación de usuarios</title>
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
          <c:if test="${sessionScope.rol == '3' && usuario.rol!='2'}" >
            <c:redirect url = "gestionUsuarios"/>
          </c:if>
          <div class="card">
            <div class="card-header">
              Modificación de usuarios - Datos personales
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-12">
                  <form
                          class="needs-validation"
                          novalidate
                          action="actualizarUsuario"
                          method="POST"
                  >
                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <input type="hidden" name="id_usuario" value="${usuario.id_usuario}"/>
                          <label class="fw-bold" for="nombre">Nombre</label>
                          <input
                                  type="text"
                                  required
                                  name="nombre"
                                  id="nombre"
                                  maxlength="50"
                                  class="form-control editable"
                                  value="${usuario.nombre}"

                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>

                        </div>
                        <div class="col">
                          <label class="fw-bold" for="apellido_paterno"
                          >Apellido Paterno</label
                          >
                          <input
                                  type="text"
                                  required
                                  name="apellido_paterno"
                                  id="apellido_paterno"
                                  maxlength="50"
                                  class="form-control editable"
                                  value="${usuario.apellido_paterno}"

                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <label class="fw-bold" for="apellido_materno"
                          >Apellido Materno</label
                          >
                          <input
                                  type="text"
                                  required
                                  name="apellido_materno"
                                  id="apellido_materno"
                                  maxlength="50"
                                  class="form-control editable"
                                  value="${usuario.apellido_materno}"

                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>
                        </div>
                        <div class="col">
                          <label class="fw-bold" for="telefono"
                          >Teléfono</label
                          >
                          <input
                                  type="text"
                                  required
                                  name="telefono"
                                  id="telefono"
                                  minlength="10"
                                  maxlength="10"
                                  pattern="[0-9]{10}"
                                  class="form-control editable"
                                  value="${usuario.telefono}"

                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo con 10 números enteros
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col-12 card-header">Dirección</div>
                      </div>
                    </div>
                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <label class="fw-bold" for="dir_calle">Calle</label>
                          <input
                                  type="text"
                                  required
                                  name="dir_calle"
                                  id="dir_calle"
                                  maxlength="50"
                                  class="form-control editable"
                                  value="${usuario.calle}"

                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>
                        </div>
                        <div class="col">
                          <label class="fw-bold" for="dir_estado"
                          >Estado</label
                          >
                          <input
                                  type="text"
                                  required
                                  name="dir_estado"
                                  id="dir_estado"
                                  maxlength="50"
                                  class="form-control editable"
                                  value="${usuario.estado}"

                          />

                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <label class="fw-bold" for="dir_colonia"
                          >Colonia</label
                          >
                          <input
                                  type="text"
                                  required
                                  name="dir_colonia"
                                  id="dir_colonia"
                                  maxlength="50"
                                  class="form-control editable"
                                  value="${usuario.colonia}"

                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>
                        </div>
                        <div class="col">
                          <label class="fw-bold" for="dir_referencias"
                          >Referencias</label
                          >
                          <input
                                  type="text"
                                  name="dir_referencias"
                                  id="dir_referencias"
                                  maxlength="50"
                                  class="form-control editable"
                                  value="${usuario.referencias}"

                          />
                        </div>
                      </div>
                    </div>

                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col">
                          <label class="fw-bold" for="dir_municipio"
                          >Municipio</label
                          >
                          <input
                                  type="text"
                                  value="${usuario.municipio}"
                                  required
                                  name="dir_municipio"
                                  id="dir_municipio"
                                  maxlength="50"
                                  class="form-control editable"

                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo
                          </div>
                        </div>
                        <div class="col">
                          <label class="fw-bold" for="cp"
                          >Código postal</label
                          >
                          <input
                                  type="text"
                                  value="${usuario.codigoPostal}"
                                  required
                                  name="cp"
                                  id="cp"
                                  minlength="5"
                                  maxlength="5"
                                  pattern="[0-9]{5}"
                                  class="form-control editable"

                          />
                          <div class="invalid-feedback">
                            Debes llenar este campo con 5 números enteros
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="form-group mb-3">
                      <div class="row">
                        <div class="col-12 text-end">
                          <a
                                  href="gestionUsuarios"
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
  }catch (Exception e){
      response.sendRedirect("menu");
    }
%>