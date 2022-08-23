package mx.edu.utez.aweb.sega.controlador.revision;

import mx.edu.utez.aweb.sega.modelo.auto.BeanAuto;
import mx.edu.utez.aweb.sega.modelo.catalogo.BeanCatalogo;
import mx.edu.utez.aweb.sega.modelo.revision.BeanRevision;
import mx.edu.utez.aweb.sega.servicios.auto.ServiceAuto;
import mx.edu.utez.aweb.sega.servicios.historial_rev.ServiceHistorial_rev;
import mx.edu.utez.aweb.sega.servicios.revision.ServiceRevision;
import mx.edu.utez.aweb.sega.servicios.catalogo.ServiceCatalogo;
import mx.edu.utez.aweb.sega.utiles.ResultAction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ServletRevision",
        urlPatterns = {
                "/gestionRevisiones",
                "/controlRevision",
                "/modificarRevision",
                "/registrarRevision",
                "/crearRevision",
                "/actualizarRevision",
                "/agregarHistRev",
                "/modificarHistRev",
                "/actualizarHistRev",
                "/eliminarHistRev",
                "/cambiarFase",
                "/cancelarRevision",
                "/eliminarRevision",
                "/revCancelada"

        })
public class ServletRevision extends HttpServlet {
    Logger logger = Logger.getLogger("ServletRevision");
    String action;
    String urlRedirect = "/menu";
    HttpSession sesion;
    ServiceRevision serviceRevision = new ServiceRevision();
    ServiceHistorial_rev serviceHistRev = new ServiceHistorial_rev();

    ServiceCatalogo serviceCatalogo = new ServiceCatalogo();
    ServiceAuto serviceAuto = new ServiceAuto();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        logger.log(Level.INFO, "Path->" + action);
        switch (action) {
            case "/gestionRevisiones":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_ejecutante = sesion.getAttribute("id").toString();
                    request.setAttribute("revisiones", serviceRevision.getAll(Long.parseLong(id_ejecutante), Long.parseLong(rol_ejecutante)));
                    urlRedirect = "/vistas/revision/gestion_revision.jsp";
                } catch (Exception e) {
                    urlRedirect = "/menu";
                }

                break;
            case "/controlRevision":
                String id_rev = request.getParameter("id");
                id_rev = (id_rev == null) ? "0" : id_rev;
                try {
                    sesion = request.getSession();
                    String rol = sesion.getAttribute("rol").toString();
                    String id = sesion.getAttribute("id").toString();
                    request.setAttribute("histCat", serviceHistRev.getHistCat(Long.parseLong(id_rev)));
                    request.setAttribute("control", serviceHistRev.getControl(Long.parseLong(id), Long.parseLong(rol), Long.parseLong(id_rev)));
                    request.setAttribute("total", serviceHistRev.getTotal(Long.parseLong(id_rev)));
                    request.setAttribute("elementos", serviceCatalogo.getAll());
                    urlRedirect = "/vistas/revision/control_revision.jsp";
                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones";
                }
                break;
            case "/cancelarRevision":
                urlRedirect = "/vistas/revision/cancelar_revision.jsp";
                break;
            case "/registrarRevision":
                urlRedirect = "/vistas/revision/crear_revision.jsp";
                break;
            case "/modificarRevision":
                String id_rev_mod = request.getParameter("id");
                id_rev_mod = (id_rev_mod == null) ? "0" : id_rev_mod;
                try {
                    sesion = request.getSession();
                    String rol_mod = sesion.getAttribute("rol").toString();
                    String id_usr_mod = sesion.getAttribute("id").toString();
                    request.setAttribute("revision", serviceRevision.getRev(
                            Long.parseLong(id_usr_mod), Long.parseLong(rol_mod), Long.parseLong(id_rev_mod)
                    ));
                    urlRedirect = "/vistas/revision/modificar_revision.jsp";
                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones";
                }
                break;
            case "/modificarHistRev":
                String id = request.getParameter("id_hist");
                id = (id == null) ? "0" : id;
                try {
                    request.setAttribute("hist", serviceHistRev.getElmHistCat(Long.parseLong(id)));
                    urlRedirect = "/vistas/revision/modificar_historial.jsp";
                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones";
                }
                break;

            default:
                urlRedirect = "/menu";
                break;
        }
        request.getRequestDispatcher(urlRedirect).forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        action = request.getServletPath();
        switch (action) {
            case "/cambiarFase":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante_chf = sesion.getAttribute("rol").toString();
                    String id_usr_chf = sesion.getAttribute("id").toString();
                    String id_rev_chf = request.getParameter("id_rev");
                    String fase = request.getParameter("fase");
                    ResultAction result3 = serviceRevision.cambiarFase(
                            Long.parseLong(id_usr_chf), Long.parseLong(rol_ejecutante_chf),
                            Long.parseLong(id_rev_chf), fase
                    );
                    urlRedirect = "/controlRevision?id=" + id_rev_chf + "&result=" +
                            result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                            + "&status=" + result3.getStatus();
                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/revCancelada":

                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id = sesion.getAttribute("id").toString();
                    String id_rev = request.getParameter("id_rev");
                    BeanRevision rev = serviceRevision.getRev(Long.parseLong(id), Long.parseLong(rol_ejecutante), Long.parseLong(id_rev));
                    if (rev == null) {
                        urlRedirect = "/cancelarRevision?result=false&message=" +
                                URLEncoder.encode("Revision inexistente...",
                                        StandardCharsets.UTF_8.name()) + "&status=400";
                    } else if (!rev.getFase().equals("Ingreso")) {
                        urlRedirect = "/cancelarRevision?result=false&message=" +
                                URLEncoder.encode("No se puede cancelar una revision que no esta en estado ingreso...",
                                        StandardCharsets.UTF_8.name()) + "&status=400";
                    } else {
                        ResultAction result3 = serviceRevision.cancelar(Long.parseLong(id_rev),
                                Long.parseLong(rol_ejecutante), Long.parseLong(id));
                        urlRedirect = "/cancelarRevision?result=" +
                                result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                                + "&status=" + result3.getStatus();
                    }
                } catch (Exception e) {
                    urlRedirect = "/cancelarRevision?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/crearRevision":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_usr = sesion.getAttribute("id").toString();
                    String matricula = request.getParameter("matricula");
                    BeanAuto auto = serviceAuto.getAuto(matricula);
                    if (auto == null) {
                        urlRedirect = "/registrarRevision?result=false&message=" +
                                URLEncoder.encode("Auto inexistente...",
                                        StandardCharsets.UTF_8.name()) + "&status=400";
                    } else {
                        ResultAction result3 = serviceRevision.crear(matricula,
                                Long.parseLong(id_usr), Long.parseLong(rol_ejecutante));
                        urlRedirect = "/gestionRevisiones?result=" +
                                result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                                + "&status=" + result3.getStatus();
                    }
                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/actualizarRevision":
                try {
                    sesion = request.getSession();
                    String id_usr = sesion.getAttribute("id").toString();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_rev = request.getParameter("id_rev");
                    String fase = request.getParameter("fase");
                    String observaciones = request.getParameter("observaciones");
                    ResultAction result3 = serviceRevision.actualizar(Long.parseLong(id_usr),
                            Long.parseLong(rol_ejecutante), Long.parseLong(id_rev), fase, observaciones);
                    urlRedirect = "/gestionRevisiones?result=" +
                            result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                            + "&status=" + result3.getStatus();

                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/eliminarRevision":
                try {
                    sesion = request.getSession();
                    String id_usr = sesion.getAttribute("id").toString();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_rev = request.getParameter("id_rev");
                    ResultAction result3 = serviceRevision.eliminar(Long.parseLong(id_usr),
                            Long.parseLong(rol_ejecutante), Long.parseLong(id_rev));
                    urlRedirect = "/gestionRevisiones?result=" +
                            result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                            + "&status=" + result3.getStatus();

                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/actualizarHistRev":
                try {
                    String id_rev = request.getParameter("id_rev");
                    String id_hist = request.getParameter("id_hist");
                    String n_cantidad = request.getParameter("cantidad");
                    if (Long.parseLong(n_cantidad) < 1) {
                        urlRedirect = "/modificarHistRev?id_hist=" + id_hist + "&result=false&message=" + URLEncoder.encode("La cantidad debe ser mayor a 0",
                                StandardCharsets.UTF_8.name()) + "&status=400";

                    } else {
                        ResultAction result3 = serviceRevision.modificarHist(Long.parseLong(id_rev),
                                Long.parseLong(id_hist), Long.parseLong(n_cantidad));
                        if (result3.isResult()) {
                            urlRedirect = "/controlRevision?id=" + id_rev + "&result=" +
                                    result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                                    + "&status=" + result3.getStatus();
                        } else {
                            urlRedirect = "/modificarHistRev?id_hist=" + id_hist + "&result=" + result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(),
                                    StandardCharsets.UTF_8.name()) + "&status=" + result3.getStatus();
                        }

                    }


                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones?result=false&message=" + URLEncoder.encode(e.toString(), StandardCharsets.UTF_8.name()) + "&status=500";
                }
                break;
            case "/agregarHistRev":
                try {
                    String id_rev = request.getParameter("id_rev");
                    String id_elm = request.getParameter("id_elemento");
                    String tipo_elm = request.getParameter("tipo_elemento");
                    String observaciones = request.getParameter("observaciones");
                    String cantidad = request.getParameter("cantidad");
                    BeanCatalogo cat = serviceCatalogo.getElemento(Long.parseLong(id_elm));
                    if (cat == null) {
                        urlRedirect = "/controlRevision?id=" + id_rev + "&result=false&message=" + URLEncoder.encode("Elemento del catálogo no encontrado",
                                StandardCharsets.UTF_8.name()) + "&status=400";
                    } else if (cat.getTipo_elemento().equals("Servicio") && !tipo_elm.equals("Servicio")) {
                        ResultAction result3 = serviceRevision.agregarHist(Long.parseLong(id_rev),
                                Long.parseLong(id_elm), observaciones, 1);
                        urlRedirect = "/controlRevision?id=" + id_rev + "&result=" +
                                result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage() + " , pero es un Servicio y no lleva cantidad", StandardCharsets.UTF_8.name())
                                + "&status=" + result3.getStatus();
                    } else if (cat.getTipo_elemento().equals("Producto") && !tipo_elm.equals("Producto")) {
                        ResultAction result3 = serviceRevision.agregarHist(Long.parseLong(id_rev),
                                Long.parseLong(id_elm), observaciones, 1);
                        urlRedirect = "/controlRevision?id=" + id_rev + "&result=" +
                                result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage() + " , pero es un Producto y se coloco cantidad utilizada de 1", StandardCharsets.UTF_8.name())
                                + "&status=" + result3.getStatus();
                    } else {
                        if (Long.parseLong(cantidad) < 1) {
                            urlRedirect = "/controlRevision?id=" + id_rev + "&result=false&message=" + URLEncoder.encode("La cantidad debe ser mayor a 0",
                                    StandardCharsets.UTF_8.name()) + "&status=400";
                        } else {
                            ResultAction result3 = serviceRevision.agregarHist(Long.parseLong(id_rev),
                                    Long.parseLong(id_elm), observaciones, Long.parseLong(cantidad));
                            urlRedirect = "/controlRevision?id=" + id_rev + "&result=" +
                                    result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                                    + "&status=" + result3.getStatus();
                        }
                    }
                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones?result=false&message=" + URLEncoder.encode(e.toString(), StandardCharsets.UTF_8.name()) + "&status=500";
                }
                break;
            case "/eliminarHistRev":
                try {
                    String id_rev = request.getParameter("id_rev");
                    String id_hist = request.getParameter("id_hist");
                    ResultAction result3 = serviceRevision.eliminarHist(Long.parseLong(id_rev),
                            Long.parseLong(id_hist));
                    urlRedirect = "/gestionRevisiones?result=" +
                            result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                            + "&status=" + result3.getStatus();

                } catch (Exception e) {
                    urlRedirect = "/gestionRevisiones?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            default:
                urlRedirect = "/menu";
                break;
        }
        response.sendRedirect(request.getContextPath() + urlRedirect);
    }
}


