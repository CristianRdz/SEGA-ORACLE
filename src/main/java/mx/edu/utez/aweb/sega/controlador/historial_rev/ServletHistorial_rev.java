package mx.edu.utez.aweb.sega.controlador.historial_rev;

import mx.edu.utez.aweb.sega.modelo.auto.BeanAuto;
import mx.edu.utez.aweb.sega.modelo.historial_rev.BeanHistorial_rev;
import mx.edu.utez.aweb.sega.servicios.historial_rev.ServiceHistorial_rev;
import mx.edu.utez.aweb.sega.utiles.ResultAction;
import mx.edu.utez.aweb.sega.utiles.EmailSend;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ServletHistorial_rev",
        urlPatterns = {
                "/verDetallesHist",
                "/verHistorial"



        })
public class ServletHistorial_rev extends HttpServlet {
    Logger logger = Logger.getLogger("ServletHistorial_rev");
    String action;
    String urlRedirect = "/menu";

    HttpSession sesion;
    ServiceHistorial_rev serviceHistRev = new ServiceHistorial_rev();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        logger.log(Level.INFO, "Path->" + action);
        switch (action) {
            case "/verDetallesHist":
                String id_rev = request.getParameter("id");
                id_rev = (id_rev == null) ? "0" : id_rev;
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_ejecutante = sesion.getAttribute("id").toString();
                    request.setAttribute("histCat", serviceHistRev.getHistCat(Long.parseLong(id_rev)));
                    request.setAttribute("control",serviceHistRev.getControl(Long.parseLong(id_ejecutante),Long.parseLong(rol_ejecutante),Long.parseLong(id_rev)));
                    request.setAttribute("total",serviceHistRev.getTotal(Long.parseLong(id_rev)));
                    urlRedirect = "/vistas/historial_rev/historial_detalles.jsp";
                } catch (Exception e) {
                    urlRedirect = "/menu";
                }
                break;
            case "/verHistorial":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_ejecutante = sesion.getAttribute("id").toString();
                    request.setAttribute("historial", serviceHistRev.getHistorial(Long.parseLong(id_ejecutante), Long.parseLong(rol_ejecutante)));
                    urlRedirect = "/vistas/historial_rev/ver_historial.jsp";
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


            default:
                urlRedirect = "/menu";
                break;
        }
        response.sendRedirect(request.getContextPath() + urlRedirect);
    }
}
