package mx.edu.utez.aweb.sega.controlador.auto;

import mx.edu.utez.aweb.sega.modelo.auto.BeanAuto;
import mx.edu.utez.aweb.sega.modelo.usuario.BeanUsuario;
import mx.edu.utez.aweb.sega.servicios.auto.ServiceAuto;
import mx.edu.utez.aweb.sega.servicios.usuario.ServiceUsuario;
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

@WebServlet(name = "ServletAuto",
        urlPatterns = {
                "/gestionAutos",
                "/verAutos",
                "/crearAuto",
                "/modificarAuto",
                "/actualizarAuto",
                "/registrarAuto",
                "/guardarAuto",
                "/eliminarAuto",

        })
public class ServletAuto extends HttpServlet {
    Logger logger = Logger.getLogger("ServletAuto");
    String action;
    String urlRedirect = "/menu";
    HttpSession sesion;
    ServiceAuto serviceAuto = new ServiceAuto();
    ServiceUsuario serviceUsuario = new ServiceUsuario();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        logger.log(Level.INFO, "Path->" + action);
        switch (action) {
            case "/gestionAutos":
                request.setAttribute("autos", serviceAuto.getAll());
                urlRedirect = "/vistas/auto/gestion_autos.jsp";
                break;
            case "/registrarAuto":
                urlRedirect = "/vistas/auto/crear_autos.jsp";
                break;
            case "/modificarAuto":
                String matricula = request.getParameter("matricula");
                matricula = (matricula == null) ? "0" : matricula;
                try {
                    BeanAuto auto = new BeanAuto();
                    auto = serviceAuto.getAuto(matricula);
                    request.setAttribute("auto", auto);
                    urlRedirect = "/vistas/auto/modificar_autos.jsp";
                } catch (Exception e) {
                    urlRedirect = "/menu";
                }
                break;
            case "/verAutos":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_ejecutante = sesion.getAttribute("id").toString();
                    request.setAttribute("autos", serviceAuto.verAutos(Long.parseLong(id_ejecutante), Long.parseLong(rol_ejecutante)));
                    urlRedirect = "/vistas/auto/ver_autos.jsp";
                }catch (Exception e){
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

            case "/crearAuto":
                try {
                    String matricula = request.getParameter("matricula");
                    String modelo = request.getParameter("modelo");
                    String marca = request.getParameter("marca");
                    String color = request.getParameter("color");
                    String n_serie = request.getParameter("n_serie");
                    String n_constancia = request.getParameter("n_constancia");
                    String tipo_combustible = request.getParameter("tipo_combustible");
                    String tipo_transmision = request.getParameter("tipo_transmision");
                    String tipo_llave = request.getParameter("tipo_llave");
                    String llave = request.getParameter("llave");
                    ResultAction existe;
                    if (tipo_llave.equals("rfc")){
                        llave = llave.toUpperCase();
                        existe = serviceUsuario.buscarPorRfc(llave);
                    }else{
                        llave = llave.toLowerCase();
                        existe = serviceUsuario.buscar(llave);
                    }
                    BeanAuto auto = new BeanAuto();
                    auto.setMatricula(matricula);
                    auto.setModelo(modelo);
                    auto.setMarca(marca);
                    auto.setColor(color);
                    auto.setN_serie(n_serie);
                    auto.setN_constancia(n_constancia);
                    auto.setTipo_combustible(tipo_combustible);
                    auto.setTipo_transmision(tipo_transmision);
                    auto.setTipo_llave(tipo_llave);
                    auto.setLlave(llave);
                    if (existe.isResult()==false){
                        urlRedirect = "/registrarAuto?result="+existe.isResult()+"&message=" + URLEncoder.encode(existe.getMessage(),
                                StandardCharsets.UTF_8.name()) +"&status="+existe.getStatus();
                    }else {
                        ResultAction registrarAct = serviceAuto.registrar(auto);
                        urlRedirect = "/gestionAutos?result=" +
                                registrarAct.isResult() + "&message=" + registrarAct.getMessage()
                                + "&status=" + registrarAct.getStatus();
                    }
                } catch (Exception e) {
                    urlRedirect = "/gestionAutos?result=false&message=Error%20de%20servidor&status=500";
                }
                break;

            case "/actualizarAuto":
                try {
                    String matricula = request.getParameter("matricula");
                    String modelo = request.getParameter("modelo");
                    String marca = request.getParameter("marca");
                    String color = request.getParameter("color");
                    String tipo_combustible = request.getParameter("tipo_combustible");
                    String tipo_transmision = request.getParameter("tipo_transmision");
                    BeanAuto auto = new BeanAuto();
                    auto.setMatricula(matricula);
                    auto.setModelo(modelo);
                    auto.setMarca(marca);
                    auto.setColor(color);
                    auto.setTipo_combustible(tipo_combustible);
                    auto.setTipo_transmision(tipo_transmision);
                    ResultAction verificarAct = serviceAuto.actualizar(auto);
                    urlRedirect = "/gestionAutos?result=" +
                            verificarAct.isResult() + "&message=" + URLEncoder.encode(verificarAct.getMessage(), StandardCharsets.UTF_8.name())
                            + "&status=" + verificarAct.getStatus();
                } catch (Exception e) {
                    urlRedirect = "/gestionAutos?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/eliminarAuto":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String matricula = request.getParameter("matricula");
                    ResultAction result3 = serviceAuto.eliminar(matricula, Long.parseLong(rol_ejecutante));
                    urlRedirect = "/gestionUsuarios?result=" +
                            result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                            + "&status=" + result3.getStatus();
                } catch (Exception e) {
                    urlRedirect = "/gestionAutos?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            default:
                urlRedirect = "/menu";
                break;
        }
        response.sendRedirect(request.getContextPath() + urlRedirect);
    }
}
