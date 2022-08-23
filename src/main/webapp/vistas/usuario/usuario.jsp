<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("correo") != null) {
%> <%-- Verificar que la sesión existe--%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Usuario</title>
    <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>

<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>

<div class="container mb-5 mt-5 p-5" data-aos="fade-up" data-aos-delay="100">
    <div class="main-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img
                                    src="vistas/assets/img/usuario.svg"
                                    alt="usuario"
                                    class="rounded-circle p-1 bg-light"
                                    width="110"
                            />
                            <div class="mt-3">
                                <h5>${usuario.nombre} ${usuario.apellido_paterno} ${usuario.apellido_materno}</h5>
                                <p class="text-secondary mb-1 rol_usuario">${usuario.rol}</p>
                            </div>
                        </div>
                        <hr class="my-4"/>
                        <ul class="list-group list-group-flush">
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="fa fa-envelope"></span> Correo:
                                </h6>
                                <span class="text-secondary"> ${usuario.correo}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="fa fa-id-card"></span> ID único:
                                </h6>
                                <span class="text-secondary"> ${usuario.id_usuario}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="fa fa-phone"></span> Teléfono:
                                </h6>
                                <span class="text-secondary"> ${usuario.telefono}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="bi bi-key-fill"></span> RFC:
                                </h6>
                                <span class="text-secondary"> ${usuario.rfc}</span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
                            >
                                <h6 class="mb-0">
                                    <span class="bi bi-card-text"></span> CURP:
                                </h6>
                                <span class="text-secondary"> ${usuario.curp}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">Datos personales</div>
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
                                        action="guardarUsuario"
                                        method="POST"
                                >
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
                                                        class="form-control editable"
                                                        value="${usuario.nombre}"
                                                        disabled
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
                                                        disabled
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
                                                        disabled
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
                                                        disabled
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
                                                        disabled
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
                                                        disabled
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
                                                        disabled
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
                                                        disabled
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
                                                        disabled
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
                                                        disabled
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
                                                <button
                                                        class="btn btn-warning m-1"
                                                        type="button"
                                                        onclick="enablerTag()"
                                                        id="enabler"
                                                >
                                                    Editar <span class="bi bi-pencil-square"></span>
                                                </button>
                                                <button
                                                        class="btn btn-success editable m-1"
                                                        disabled
                                                        type="submit"
                                                >
                                                    Guardar <span class="ri-save-line"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">Cambio de contraseña</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <form
                                                class="needs-validation"
                                                novalidate
                                                action="guardarContra"
                                                method="POST"
                                                oninput='confirmacion.setCustomValidity(confirmacion.value != n_contrasena.value ? "Las contraseñas no coinciden" : "")'
                                        >
                                            <div class="form-group mb-3">
                                                <div class="row">
                                                    <div class="col">
                                                        <label class="fw-bold" for="n_contrasena"
                                                        >Nueva contraseña</label
                                                        >
                                                        <input
                                                                type="password"
                                                                required
                                                                name="n_contrasena"
                                                                id="n_contrasena"
                                                                pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"
                                                                maxlength="100"
                                                                class="form-control"
                                                        />
                                                        <div class="invalid-feedback">
                                                            Debe contener al menos:
                                                            <ul>
                                                                <li>8 caracteres</li>
                                                                <li>Al menos una mayúscula</li>
                                                                <li>Al menos una minúscula</li>
                                                                <li>Al menos un número</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <label class="fw-bold" for="confirmacion"
                                                        >Confirma la contraseña</label
                                                        >
                                                        <input
                                                                type="password"
                                                                required
                                                                name="confirmacion"
                                                                id="confirmacion"
                                                                minlength="8"
                                                                maxlength="100"
                                                                class="form-control"
                                                        />
                                                        <div class="invalid-feedback">
                                                            Las contraseñas no coinciden
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mb-3">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <label class="fw-bold" for="contrasena"
                                                        >Contraseña actual</label
                                                        >
                                                        <input
                                                                type="password"
                                                                required
                                                                name="contrasena"
                                                                id="contrasena"
                                                                minlength="8"
                                                                maxlength="100"
                                                                class="form-control"
                                                        />
                                                        <div class="invalid-feedback">
                                                            Debes colocar tu contraseña anterior la cual
                                                            cuenta con al menos 8 caracteres
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mb-3">
                                                <div class="row">
                                                    <div class="col-12 text-end">
                                                        <button class="btn btn-success" type="submit">
                                                            Guardar <span class="ri-save-line"></span>
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
        </div>
    </div>
</div>
<div id="preloader"></div>
<a
        href="#"
        class="back-to-top d-flex align-items-center justify-content-center"
><i class="bi bi-arrow-up-short"></i
></a>

<style type="text/css">
    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid transparent;
        border-radius: 0.25rem;
        margin-bottom: 1.5rem;
        box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
    }
</style>

<jsp:include page="../../plantillas/footer.jsp"></jsp:include>
</body>

</html>
<%
    } else {
        response.sendRedirect("ingreso");
    }
%>