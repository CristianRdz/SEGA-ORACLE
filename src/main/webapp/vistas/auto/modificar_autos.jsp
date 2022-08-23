<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    try{
        if (session.getAttribute("correo") != null  && request.getParameter("matricula") != null && session.getAttribute("rol").toString().equals("1") || session.getAttribute("rol").toString().equals("3")) {
%> <%-- Verificar que la sesión existe--%>
<c:choose>
    <c:when test="${not empty auto}">
    </c:when>
    <c:otherwise>
        <c:redirect url="gestionAutos"/>
    </c:otherwise>
</c:choose>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>Modificación de autos</title>
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
                <div class="card-header">Modificación de autos</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <form
                                    class="needs-validation"
                                    novalidate
                                    action="actualizarAuto"
                                    method="POST"
                                    autocomplete="off"
                            >
                                <input type="hidden" name="matricula" value="${auto.matricula}"/>
                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col">
                                            <label class="fw-bold" for="modelo">Modelo</label>
                                            <input
                                                    type="text"
                                                    required
                                                    name="modelo"
                                                    id="modelo"
                                                    maxlength="50"
                                                    class="form-control"
                                                    placeholder="Golf GTI MK3"
                                                    value="${auto.modelo}"
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="fw-bold" for="marca">Marca</label>
                                            <input
                                                    type="text"
                                                    required
                                                    name="marca"
                                                    id="marca"
                                                    maxlength="50"
                                                    class="form-control"
                                                    placeholder="Volkswagen..."
                                                    value="${auto.marca}"
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
                                            <label class="fw-bold" for="color">Color</label>
                                            <input
                                                    class="form-control"
                                                    id="color"
                                                    name="color"
                                                    type="text"
                                                    maxlength="50"
                                                    required
                                                    placeholder="Rojo..."
                                                    value="${auto.color}"
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="fw-bold" for="tipo_combustible"
                                            >Tipo de combustible</label
                                            >
                                            <select
                                                    class="form-select"
                                                    id="tipo_combustible"
                                                    name="tipo_combustible"
                                                    required
                                            >
                                                <option disabled value="">Eligir...</option>
                                                <option selected value="${auto.tipo_combustible}">
                                                    Guardado - ${auto.tipo_combustible}
                                                </option>
                                                <option value="Gasolina">Gasolina</option>
                                                <option value="Diésel">Diésel</option>
                                                <option value="Etanol">Etanol</option>
                                                <option value="Hidrógeno">Hidrógeno</option>
                                                <option value="Biodiesel">Biodiesel</option>
                                                <option value="Electricidad">Electricidad</option>
                                                <option value="Metanol">Metanol</option>
                                                <option value="Gas natural">Gas natural</option>
                                                <option value="GLP">GLP</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Elija un tipo de combustible antes de enviar...
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="fw-bold" for="tipo_transmision"
                                            >Tipo de transmisión</label
                                            >
                                            <select
                                                    class="form-select"
                                                    id="tipo_transmision"
                                                    name="tipo_transmision"
                                                    required
                                            >
                                                <option disabled value="">Eligir...</option>
                                                <option selected value="${auto.tipo_transmision}">
                                                    Guardado - ${auto.tipo_transmision}
                                                </option>
                                                <option value="Manual">Manual</option>
                                                <option value="Automática">Automática</option>
                                                <option value="CVT">CVT</option>
                                                <option value="Semiautomática">
                                                    Semiautomática
                                                </option>
                                                <option value="Doble embrague">
                                                    Doble embrague
                                                </option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Elija un tipo de transmisión antes de enviar...
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col-12 text-end">
                                            <a
                                                    href="gestionAutos"
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