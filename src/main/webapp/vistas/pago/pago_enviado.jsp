<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  try {
    if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("2")) {
%> <%-- Verificar que la sesión existe--%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Pago enviado</title>
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
            <div class="card-header">Estado del pago</div>
            <div class="card-body">
              <div class="row">
                <div class="col-12">
                  <div
                    class="d-flex flex-column align-items-center text-center"
                  >
                    <img
                      src="../assets/img/pago2.gif"
                      alt="fase"
                      class="p-1 bg-transparent"
                      width="220"
                    />
                    <h1 id="pagoenviado" class="mb-4">¡Tu pago fue enviado!</h1>
                    <p class="mb-5">
                      Muchas gracias por su pago, este debe de ser aprobado por un
                      cajero<br />
                      le enviaremos un correo cuando pueda recoger su auto.<br>
                      <span class="bi bi-eye-fill"></span><strong> No olvides comprobar la bandeja de spam </strong><span class="bi bi-eye-fill"></span>
                    </p>
                    <a
                      href="../usuario/menu.jsp"
                      class="btn btn-primary mb-2"
                      >Ir al menu <span class="bi bi-arrow-right-circle"></span
                    ></a>
        </div>
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