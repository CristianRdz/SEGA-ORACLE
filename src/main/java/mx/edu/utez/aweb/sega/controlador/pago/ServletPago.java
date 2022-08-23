package mx.edu.utez.aweb.sega.controlador.pago;

import mx.edu.utez.aweb.sega.servicios.historial_rev.ServiceHistorial_rev;
import mx.edu.utez.aweb.sega.servicios.pago.ServicePago;
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


@WebServlet(name = "ServletPago",
        urlPatterns = {
                "/verPagos",
                "/verDetallesPago",
                "/accionarPago"

        })
public class ServletPago extends HttpServlet {

    Logger logger = Logger.getLogger("ServletPago");
    String action;
    String urlRedirect = "/menu";
    HttpSession sesion;
    ServicePago servicePago = new ServicePago();
    ServiceHistorial_rev serviceHistRev = new ServiceHistorial_rev();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        logger.log(Level.INFO, "Path->" + action);
        switch (action) {
            case "/verPagos":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_ejecutante = sesion.getAttribute("id").toString();
                    request.setAttribute("pagos", servicePago.getAll(Long.parseLong(id_ejecutante), Long.parseLong(rol_ejecutante)));
                    urlRedirect = "/vistas/pago/ver_pagos.jsp";
                } catch (Exception e) {
                    urlRedirect = "/menu";
                }
                break;
            case "/verDetallesPago":
                try {
                    sesion = request.getSession();
                    String id_rev = request.getParameter("id_rev");
                    String id_pago = request.getParameter("id_pago");
                    request.setAttribute("id_pago",id_pago);
                    request.setAttribute("id_rev",id_rev);
                    request.setAttribute("histCat", serviceHistRev.getHistCat(Long.parseLong(id_rev)));
                    request.setAttribute("total", serviceHistRev.getTotal(Long.parseLong(id_rev)));
                    urlRedirect = "/vistas/pago/pago_detalles.jsp";
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
            case "/accionarPago":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id_ejecutante = sesion.getAttribute("id").toString();
                    String id_rev = request.getParameter("id_rev");
                    String id_pago = request.getParameter("id_pago");
                    ResultAction result3 = servicePago.accionarPago(Long.parseLong(id_ejecutante),
                            Long.parseLong(rol_ejecutante), Long.parseLong(id_rev), Long.parseLong(id_pago));
                    urlRedirect = "/verPagos?result=" +
                            result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                            + "&status=" + result3.getStatus();
                } catch (Exception e) {
                    urlRedirect = "/menu";
                }
                break;

            default:
                urlRedirect = "/menu";
                break;
        }
        response.sendRedirect(request.getContextPath() + urlRedirect);
    }
}
