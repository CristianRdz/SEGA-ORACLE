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

    <title>Registro de autos</title>
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
                <div class="card-header">Registro de autos</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <c:choose>
                                <c:when test="${param['result']}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <c:out value="${param['message']}"></c:out>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:when>
                                <c:when test="${param['result']==false}">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <c:out value="${param['message']}"></c:out>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                            <form
                                    class="needs-validation"
                                    novalidate
                                    action="crearAuto"
                                    method="POST"
                                    autocomplete="off"
                            >
                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col">
                                            <label class="fw-bold" for="matricula"
                                            >Matrícula</label
                                            >
                                            <input
                                                    type="text"
                                                    required
                                                    name="matricula"
                                                    id="matricula"
                                                    minlength="9"
                                                    maxlength="9"
                                                    class="form-control"
                                                    placeholder="PXP-33-53..."
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo con 9 caracteres
                                            </div>
                                        </div>
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
                                            <label class="fw-bold" for="marca">Marca</label>
                                            <input
                                                    type="text"
                                                    required
                                                    name="marca"
                                                    id="marca"
                                                    maxlength="50"
                                                    class="form-control"
                                                    placeholder="Volkswagen..."
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo
                                            </div>
                                        </div>
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
                                            <label class="fw-bold" for="n_serie"
                                            >Número de identificación vehicular (NIV)</label
                                            >
                                            <input
                                                    type="text"
                                                    required
                                                    name="n_serie"
                                                    id="n_serie"
                                                    pattern="(?=.*\d|[A-Z])(?=.*[A-Z])[A-Z0-9]{17}"
                                                    minlength="17"
                                                    maxlength="17"
                                                    class="form-control"
                                                    placeholder="WP0ZZZ99ZSS321124..."
                                                    onkeyup="this.value = this.value.toUpperCase();"
                                            />
                                            <div class="invalid-feedback">
                                                Debe tener:
                                                <ul>
                                                    <li>17 caracteres</li>
                                                    <li class="text-success">
                                                        No se aceptan NIVs invalidos
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="fw-bold" for="n_constancia"
                                            >Número de Constancia de Inscripción (NCI)</label
                                            >
                                            <input
                                                    type="text"
                                                    required
                                                    name="n_constancia"
                                                    id="n_constancia"
                                                    pattern="[0-9]+"
                                                    minlength="8"
                                                    maxlength="8"
                                                    class="form-control"
                                                    placeholder="93740021..."
                                            />
                                            <div class="invalid-feedback">
                                                Debe tener 8 números enteros
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <div class="row">
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
                                                <option selected disabled value="">
                                                    Eligir...
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
                                        <div class="col">
                                            <label class="fw-bold" for="tipo_transmision"
                                            >Tipo de transmisión</label
                                            >
                                            <select
                                                    class="form-select"
                                                    id="tipo_transmision"
                                                    name="tipo_transmision"
                                                    required
                                            >
                                                <option selected disabled value="">
                                                    Eligir...
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
                                        <div class="col">
                                            <label class="fw-bold" for="tipo_llave"
                                            >Identificador del dueño</label
                                            >
                                            <select
                                                    class="form-select"
                                                    id="tipo_llave"
                                                    name="tipo_llave"
                                                    required
                                            >
                                                <option selected disabled value="">
                                                    Eligir...
                                                </option>
                                                <option value="correo">Correo</option>
                                                <option value="rfc">RFC</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Elija antes de enviar...
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="fw-bold" for="llave" id="txtid"
                                            >Identificador</label
                                            >
                                            <input
                                                    type="text"
                                                    required
                                                    disabled
                                                    name="llave"
                                                    id="llave"
                                                    class="form-control"

                                            />
                                            <div class="invalid-feedback">
                                                Este campo tiene que ser valido...
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
                                                    href="gestionAutos"
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