<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  try {
    if (session.getAttribute("correo") != null && session.getAttribute("rol").toString().equals("1")
            || session.getAttribute("rol").toString().equals("2")) {
%> <%-- Verificar que la sesión existe--%>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />

  <title>Historial de revisión</title>
  <jsp:include page="../../plantillas/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../plantillas/navbar.jsp"></jsp:include>
<section id="hero" class="d-flex align-items-center">
  <div
          class="container container-cars position-relative"
          data-aos="fade-up"
          data-aos-delay="100"
  >
    <div class="row icon-boxes">
      <div class="icon-box mb-5 mt-5 mb-lg-0">

        <div class="container">
          <div class="row text-center justify-content-center mb-5">
            <div class="col-xl-6 col-lg-8">
              <h2 class="font-weight-bold">Fases de la revisión</h2>
            </div>
          </div>

          <div class="row">
            <div class="col">
              <div
                      class="timeline-steps aos-init aos-animate"
                      data-aos="fade-up"
              >
                <div class="timeline-step">
                  <div
                          class="timeline-content"
                          data-toggle="popover"
                          data-trigger="hover"
                          data-placement="top"
                          title=""
                          data-content="And here's some amazing content. It's very engaging. Right?"
                          data-original-title="2004"
                  >
                    <div class="inner-circle"></div>
                    <div align="center">
                      <img src="vistas/assets/img/fases/Ingreso.svg" alt="" srcset="" width="200">
                    </div>
                  </div>
                </div>
                <div class="timeline-step">
                  <div
                          class="timeline-content"
                          data-toggle="popover"
                          data-trigger="hover"
                          data-placement="top"
                          title=""
                          data-content="And here's some amazing content. It's very engaging. Right?"
                          data-original-title="2004"
                  >
                    <div class="inner-circle"></div>
                    <div align="center">
                      <img src="vistas/assets/img/fases/Inspección y realización.svg" alt="" srcset="" width="200">
                    </div>
                  </div>
                </div>
                <div class="timeline-step">
                  <div
                          class="timeline-content"
                          data-toggle="popover"
                          data-trigger="hover"
                          data-placement="top"
                          title=""
                          data-content="And here's some amazing content. It's very engaging. Right?"
                          data-original-title="2005"
                  >
                    <div class="inner-circle"></div>
                    <div align="center">
                      <img src="vistas/assets/img/fases/En pruebas.svg" alt="" srcset="" width="200">
                    </div>
                  </div>
                </div>
                <div class="timeline-step">
                  <div
                          class="timeline-content"
                          data-toggle="popover"
                          data-trigger="hover"
                          data-placement="top"
                          title=""
                          data-content="And here's some amazing content. It's very engaging. Right?"
                          data-original-title="2010"
                  >
                    <div class="inner-circle"></div>
                    <div align="center">
                      <img src="vistas/assets/img/fases/Salida del taller.svg" alt="" srcset="" width="200">
                    </div>
                  </div>
                </div>
                <div class="timeline-step mb-0">
                  <div
                          class="timeline-content"
                          data-toggle="popover"
                          data-trigger="hover"
                          data-placement="top"
                          title=""
                          data-content="And here's some amazing content. It's very engaging. Right?"
                          data-original-title="2020"
                  >
                    <div class="inner-circle"></div>
                    <div align="center">
                      <img src="vistas/assets/img/fases/Finalizado.svg" alt="" srcset="" width="200">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row icon-boxes">
      <c:choose>
        <c:when test="${not empty historial}">
        </c:when>
        <c:otherwise>
          <p class="mt-5 p-5 text-center fw-bold">
            No hay revisiones aún...
          </p>
        </c:otherwise>
      </c:choose>
      <c:forEach var="elmHist" items="${historial}" varStatus="status">
      <div class="icon-box mb-5 mt-5 mb-lg-0">
        <div class="d-flex flex-column align-items-center text-center">
          <img
                  src="vistas/assets/img/fases/${elmHist.fase}.svg"
                  alt="fase"
                  class="p-1 bg-transparent"
                  width="220"
          />
        </div>
        <h4 class="title">${elmHist.marca} ${elmHist.modelo}</h4>
        <div class="description">
          Detalles:
          <hr class="my-4" />
          <ul class="list-group list-group-flush">
            <li
                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
            >
              <h6 class="mb-0">
                    <span
                            class="iconify"
                            data-icon="radix-icons:id-card"
                    ></span>
                ID revisión:
              </h6>
              <span class="text-secondary">${elmHist.id_rev}</span>
            </li>
            <li
                    class="list-group-item d-flex justify-content-between align-items-center flex-wrap"
            >
              <h6 class="mb-0">
                <span class="bi bi-calendar-date"></span> Último movimiento:
              </h6>
              <span class="text-secondary">${elmHist.fecha_ult_mov} </span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
              <h6 class="mb-0">
                <span class="fa fa-credit-card"></span> Matrícula:
              </h6>
              <span class="text-secondary">${elmHist.matricula}</span>
            </li>

            <li
                    class="list-group-item d-flex justify-content-center align-items-center flex-wrap"
            >
              <a href="verDetallesHist?id=${elmHist.id_rev}" class="btn btn-success btn-sm m-1"
              >Ver detalles <i class="fa fa-arrow-circle-right"></i
              ></a>
            </li>
          </ul>
        </div>
      </div>
      </c:forEach>
    </div>
  </div>
</section>
<!-- End Hero -->

<main id="main"></main>

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