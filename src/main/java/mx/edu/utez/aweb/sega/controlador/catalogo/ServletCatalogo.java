package mx.edu.utez.aweb.sega.controlador.catalogo;


import mx.edu.utez.aweb.sega.modelo.catalogo.BeanCatalogo;
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

@WebServlet(name = "ServletCatalogo",
        urlPatterns = {
                "/gestionCatalogo",
                "/registrarElemento",
                "/modificarElemento",
                "/crearElemento",
                "/actualizarElemento",
                "/eliminarElemento"

        })
public class ServletCatalogo extends HttpServlet {
    Logger logger = Logger.getLogger("ServletCatalogo");
    String action;
    String urlRedirect = "/menu";
    HttpSession sesion;
    ServiceCatalogo serviceCatalogo = new ServiceCatalogo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        logger.log(Level.INFO, "Path->" + action);
        switch (action) {
            case "/gestionCatalogo":
                request.setAttribute("elementos", serviceCatalogo.getAll());
                urlRedirect = "/vistas/catalogo/gestion_catalogo.jsp";
                break;
            case "/registrarElemento":
                urlRedirect = "/vistas/catalogo/crear_elemento.jsp";
                break;
            case "/modificarElemento":
                String id = request.getParameter("id");
                id = (id == null) ? "0" : id;
                try {
                    BeanCatalogo elemento = new BeanCatalogo();
                    elemento = serviceCatalogo.getElemento(Long.parseLong(id));
                    request.setAttribute("elementos", elemento);
                    urlRedirect = "/vistas/catalogo/modificar_elemento.jsp";
                } catch (Exception e) {
                    urlRedirect = "/menu";
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
            case "/crearElemento":
                try {
                    String nombre = request.getParameter("nombre");
                    String descripcion = request.getParameter("descripcion");
                    String precio = request.getParameter("precio");
                    String tipo_elemento = request.getParameter("tipo_elemento");
                    String cantidad = request.getParameter("cantidad");
                    BeanCatalogo elemento = new BeanCatalogo();
                    elemento.setNombre(nombre);
                    elemento.setDescripcion(descripcion);
                    elemento.setPrecio(Double.parseDouble(precio));
                    elemento.setTipo_elemento(tipo_elemento);
                    elemento.setCantidad(Long.parseLong(cantidad));
                    if (Long.parseLong(cantidad) < 1) {
                        urlRedirect = "/registrarElemento?result=false&message=" +
                                URLEncoder.encode("La cantidad debe ser mayor a 0",
                                        StandardCharsets.UTF_8.name()) + "&status=400";
                    } else if (Double.parseDouble(precio) < 1) {
                        urlRedirect = "/registrarElemento?result=false&message=" +
                                URLEncoder.encode("El precio tiene que ser mayor a 0.00",
                                        StandardCharsets.UTF_8.name()) + "&status=400";
                    } else {
                        ResultAction registrarAct = serviceCatalogo.registrar(elemento);
                        urlRedirect = "/gestionCatalogo?result=" +
                                registrarAct.isResult() + "&message=" +
                                URLEncoder.encode(registrarAct.getMessage(),
                                        StandardCharsets.UTF_8.name())
                                + "&status=" + registrarAct.getStatus();
                    }

                } catch (Exception e) {
                    urlRedirect = "/gestionCatalogo?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/actualizarElemento":
                try {
                    sesion = request.getSession();
                    String rol = sesion.getAttribute("rol").toString();
                    String id_elemento = request.getParameter("id_elemento");
                    String nombre = request.getParameter("nombre");
                    String descripcion = request.getParameter("descripcion");
                    String precio = request.getParameter("precio");
                    String tipo_elemento = request.getParameter("tipo_elemento");
                    String cantidad = request.getParameter("cantidad");
                    BeanCatalogo elemento = new BeanCatalogo();
                    elemento.setId_elemento(Long.parseLong(id_elemento));
                    elemento.setNombre(nombre);
                    elemento.setDescripcion(descripcion);
                    elemento.setPrecio(Double.parseDouble(precio));
                    elemento.setTipo_elemento(tipo_elemento);
                    elemento.setCantidad(Long.parseLong(cantidad));
                    if (Long.parseLong(cantidad) < 1) {
                        urlRedirect = "/modificarElemento?id=" + id_elemento + "&result=false&message=" +
                                URLEncoder.encode("La cantidad debe ser mayor a 0",
                                        StandardCharsets.UTF_8.name()) + "&status=400";

                    } else if (Double.parseDouble(precio) < 1) {
                        urlRedirect = "/modificarElemento?id=" + id_elemento + "&result=false&message=" +
                                URLEncoder.encode("El precio tiene que ser mayor a 0.00",
                                        StandardCharsets.UTF_8.name()) + "&status=400";
                    } else {
                        ResultAction verificarAct = serviceCatalogo.actualizar(elemento, Long.parseLong(rol));
                        urlRedirect = "/gestionCatalogo?result=" +
                                verificarAct.isResult() + "&message=" +
                                URLEncoder.encode(verificarAct.getMessage(),
                                        StandardCharsets.UTF_8.name())
                                + "&status=" + verificarAct.getStatus();
                    }
                } catch (Exception e) {
                    urlRedirect = "/gestionCatalogo?result=false&message=Error%20de%20servidor&status=500";
                }
                break;

            case "/eliminarElemento":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_elemento = request.getParameter("id_elemento");
                    ResultAction result3 = serviceCatalogo.eliminar(Long.parseLong(id_elemento), Long.parseLong(rol_ejecutante));
                    urlRedirect = "/gestionCatalogo?result=" +
                            result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                            + "&status=" + result3.getStatus();
                    System.out.println(rol_ejecutante);
                    System.out.println(id_elemento);
                } catch (Exception e) {
                    urlRedirect = "/gestionCatalogo?result=false&message=Error%20de%20servidor&status=500";
                    System.out.println("eliminar" + e);
                }
                break;
            default:
                urlRedirect = "/menu";
                break;
        }
        response.sendRedirect(request.getContextPath() + urlRedirect);
    }
}

