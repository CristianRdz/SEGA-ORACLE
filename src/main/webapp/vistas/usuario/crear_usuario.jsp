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

    <title>Registro de usuarios</title>
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
                    Registro de usuarios - Datos personales
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <form
                                    class="needs-validation"
                                    novalidate
                                    action="crearUsuario"
                                    method="POST"
                                    autocomplete="off"
                                    oninput='confirmacion.setCustomValidity(confirmacion.value != contrasena.value ? "Las contraseñas no coinciden" : "")'
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
                                                    class="form-control"
                                                    placeholder="..."
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
                                                    class="form-control"
                                                    placeholder="..."
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
                                                    class="form-control"
                                                    placeholder="..."
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="fw-bold" for="correo">Correo</label>
                                            <input
                                                    class="form-control"
                                                    id="correo"
                                                    name="correo"
                                                    type="email"
                                                    maxlength="100"
                                                    placeholder="nombre@ejemplo.com"
                                                    required
                                                    onkeyup="this.value = this.value.toLowerCase();"
                                            />
                                            <div
                                                    class="invalid-feedback"
                                                    data-sb-feedback="email:required"
                                            >
                                                El formato del correo es incorrecto...
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col">
                                            <label class="fw-bold" for="curp">CURP</label>
                                            <input
                                                    type="text"
                                                    required
                                                    name="curp"
                                                    id="curp"
                                                    pattern="[A-Z]{1}[AEIOU]{1}[A-Z]{2}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[HM]{1}(AS|BC|BS|CC|CS|CH|CL|CM|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)[B-DF-HJ-NP-TV-Z]{3}[0-9A-Z]{1}[0-9]{1}"
                                                    minlength="18"
                                                    maxlength="18"
                                                    class="form-control"
                                                    placeholder="SAMJ800901HTLNXN09..."
                                                    onkeyup="this.value = this.value.toUpperCase();"
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo con:
                                                <ul>
                                                    <li>18 caracteres</li>
                                                    <li class="text-success">
                                                        No se aceptan CURPs invalidos
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="fw-bold" for="telefono">Teléfono</label>
                                            <input
                                                    type="text"
                                                    required
                                                    name="telefono"
                                                    id="telefono"
                                                    minlength="10"
                                                    maxlength="10"
                                                    pattern="[0-9]{10}"
                                                    class="form-control"
                                                    placeholder="777606012..."
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo con 10 números enteros
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col">
                                            <label class="fw-bold" for="rfc">RFC</label>
                                            <input
                                                    type="text"
                                                    required
                                                    name="rfc"
                                                    id="rfc"
                                                    pattern="^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[A-Z|\d]{3})$"
                                                    minlength="12"
                                                    maxlength="13"
                                                    class="form-control"
                                                    placeholder="CACX7605101P8..."
                                                    onkeyup="this.value = this.value.toUpperCase();"
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo con:
                                                <ul>
                                                    <li>12 caracteres para persona moral</li>
                                                    <li>13 caracteres para persona física</li>
                                                    <li class="text-success">
                                                        No se aceptan RFCs invalidos
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="fw-bold" for="contrasena"
                                            >Contraseña</label
                                            >
                                            <input
                                                    type="password"
                                                    required
                                                    name="contrasena"
                                                    id="contrasena"
                                                    pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"
                                                    minlength="8"
                                                    maxlength="100"
                                                    class="form-control"
                                                    placeholder="..."
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
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col-6">
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
                                                    placeholder="..."
                                            />
                                            <div class="invalid-feedback">
                                                Las contraseñas no coinciden
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
                                                    class="form-control"
                                                    placeholder="..."
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="fw-bold" for="dir_estado">Estado</label>
                                            <input
                                                    type="text"
                                                    required
                                                    name="dir_estado"
                                                    id="dir_estado"
                                                    maxlength="50"
                                                    class="form-control"
                                                    placeholder="..."
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
                                                    class="form-control"
                                                    placeholder="..."
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
                                                    class="form-control"
                                                    placeholder="..."
                                            />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="fw-bold" for="dir_municipio"
                                            >Municipio</label
                                            >
                                            <input
                                                    type="text"
                                                    required
                                                    name="dir_municipio"
                                                    id="dir_municipio"
                                                    maxlength="50"
                                                    class="form-control"
                                                    placeholder="..."
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <label class="fw-bold" for="cp">Código postal</label>
                                            <input
                                                    type="text"
                                                    required
                                                    name="cp"
                                                    id="cp"
                                                    minlength="5"
                                                    maxlength="5"
                                                    pattern="[0-9]{5}"
                                                    class="form-control"
                                                    placeholder="62873..."
                                            />
                                            <div class="invalid-feedback">
                                                Debes llenar este campo con 5 números enteros
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="fw-bold" for="rol">Rol</label>
                                            <select
                                                    class="form-select"
                                                    id="rol"
                                                    name="rol"
                                                    required
                                            >
                                                <option selected disabled value="">
                                                    Eligir...
                                                </option>
                                                <% if (session.getAttribute("rol").toString().equals("3")) {%>
                                                <option value="2">Cliente</option>
                                                <%} else {%>
                                                <option value="1">Gerente</option>
                                                <option value="2">Cliente</option>
                                                <option value="3">Asistente</option>
                                                <option value="4">Cajero</option>
                                                <option value="5">Mecánico</option>
                                                <%}%>
                                            </select>
                                            <div class="invalid-feedback">
                                                Eliga un rol antes de enviar...
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
                                            <a href="menu" class="btn btn-danger"
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