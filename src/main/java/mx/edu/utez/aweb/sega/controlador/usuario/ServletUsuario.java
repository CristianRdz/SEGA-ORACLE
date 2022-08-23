package mx.edu.utez.aweb.sega.controlador.usuario;

import mx.edu.utez.aweb.sega.modelo.usuario.BeanUsuario;
import mx.edu.utez.aweb.sega.servicios.usuario.ServiceUsuario;
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

@WebServlet(name = "ServletUsuario",
        urlPatterns = {
                "/gestionUsuarios",
                "/crearUsuario",
                "/usuario",
                "/modificarUsuario",
                "/actualizarUsuario",
                "/registrarUsuario",
                "/guardarUsuario",
                "/eliminarUsuario",
                "/ingresar",
                "/ingreso",
                "/recuperar",
                "/confirmar",
                "/enviarCodigo",
                "/validarCodigo",
                "/cambiarContra",
                "/recuperarContra",
                "/guardarContra",
                "/menu",
                "/salir"
        })
public class ServletUsuario extends HttpServlet {

    Logger logger = Logger.getLogger("ServletUsuario");
    String action;
    String urlRedirect = "/menu";
    HttpSession sesion;

    ServiceUsuario serviceUsuario = new ServiceUsuario();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action = request.getServletPath();
        logger.log(Level.INFO, "Path->" + action);
        switch (action) {
            case "/gestionUsuarios":
                request.setAttribute("usuarios", serviceUsuario.getAll());
                urlRedirect = "/vistas/usuario/gestion_usuarios.jsp";
                break;
            case "/registrarUsuario":
                urlRedirect = "/vistas/usuario/crear_usuario.jsp";
                break;
            case "/ingreso":
                HttpSession sesion_ck = request.getSession();
                if (sesion_ck.getAttribute("id_recu") != null || sesion_ck.getAttribute("cod") != null) {
                    if (sesion_ck.getAttribute("correo") != null) {
                        try {
                            sesion_ck.removeAttribute("id_recu");
                            sesion_ck.removeAttribute("cod");
                            sesion_ck.invalidate();
                        } catch (Exception e) {

                        }
                    } else {
                        try {
                            sesion_ck.removeAttribute("id_recu");
                            sesion_ck.removeAttribute("cod");
                            sesion_ck.invalidate();
                        } catch (Exception e) {

                        }
                    }
                }
                urlRedirect = "/index.jsp";
                break;
            case "/recuperar":
                urlRedirect = "/recuperar.jsp";
                break;
            case "/confirmar":
                urlRedirect = "/confirmar.jsp";
                break;
            case "/cambiarContra":
                urlRedirect = "/cambio.jsp";
                break;
            case "/menu":
                urlRedirect = "/vistas/usuario/menu.jsp";
                break;
            case "/salir":
                HttpSession sesion = request.getSession();
                sesion.setAttribute("correo", null);
                sesion.setAttribute("rol", null);
                sesion.setAttribute("id", null);
                sesion.invalidate();
                urlRedirect = "/ingreso";
                break;
            case "/usuario":
                try {
                    HttpSession sesionUsuario = request.getSession();
                    String correoUsuario = sesionUsuario.getAttribute("correo").toString();
                    BeanUsuario usuario = new BeanUsuario();
                    usuario = serviceUsuario.getUsuario(correoUsuario);
                    request.setAttribute("usuario", usuario);
                    urlRedirect = "/vistas/usuario/usuario.jsp";
                } catch (Exception e) {
                    urlRedirect = "/ingreso";
                }
                break;
            case "/modificarUsuario":
                String id = request.getParameter("id");
                id = (id == null) ? "0" : id;
                try {
                    BeanUsuario usuario = new BeanUsuario();
                    usuario = serviceUsuario.getUsuario(id);
                    request.setAttribute("usuario", usuario);
                    urlRedirect = "/vistas/usuario/modificar_usuario.jsp";
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
            case "/ingresar":
                try {
                    String correo = request.getParameter("correo");
                    String contrasena = request.getParameter("current-password");
                    ResultAction result_check = serviceUsuario.buscar(correo);//verificar si existe
                    ResultAction result2 = serviceUsuario.ingresar(correo, contrasena);//verificar contraseña
                    if (result_check.isResult() && result2.isResult()) {
                        BeanUsuario usuario = serviceUsuario.getUsuario(correo);
                        sesion = request.getSession();
                        sesion.setMaxInactiveInterval(86400); //24 horas max
                        sesion.setAttribute("correo", correo);
                        sesion.setAttribute("rol", usuario.getRol());
                        sesion.setAttribute("id", usuario.getId_usuario());
                        urlRedirect = "/menu?result=" +
                                result2.isResult() + "&message=" + result2.getMessage()
                                + "&status=" + result2.getStatus();
                    } else if (!result_check.isResult()) {//No existe
                        urlRedirect = "/ingreso?result=" +
                                result_check.isResult() + "&message=" + result_check.getMessage()
                                + "&status=" + result_check.getStatus();

                    } else {//Contraseña incorrecta
                        urlRedirect = "/ingreso?result=" +
                                result2.isResult() + "&message=" + result2.getMessage()
                                + "&status=" + result2.getStatus();
                    }

                } catch (Exception e) { // handle your exception
                    urlRedirect = "/ingreso?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/crearUsuario":
                try {
                    String nombre = request.getParameter("nombre");
                    String apellido_paterno = request.getParameter("apellido_paterno");
                    String apellido_materno = request.getParameter("apellido_materno");
                    String correo = request.getParameter("correo");
                    String curp = request.getParameter("curp");
                    String telefono = request.getParameter("telefono");
                    String rfc = request.getParameter("rfc");
                    String contrasena = request.getParameter("contrasena");
                    String dir_calle = request.getParameter("dir_calle");
                    String dir_estado = request.getParameter("dir_estado");
                    String dir_colonia = request.getParameter("dir_colonia");
                    String dir_referencias = request.getParameter("dir_referencias");
                    String dir_municipio = request.getParameter("dir_municipio");
                    String cp = request.getParameter("cp");
                    String rol = request.getParameter("rol");
                    BeanUsuario usuario = new BeanUsuario();

                    usuario.setNombre(nombre);
                    usuario.setApellido_paterno(apellido_paterno);
                    usuario.setApellido_materno(apellido_materno);
                    usuario.setCorreo(correo);
                    usuario.setCurp(curp);
                    usuario.setTelefono(telefono);
                    usuario.setRfc(rfc);
                    usuario.setContrasena(contrasena);
                    usuario.setCalle(dir_calle);
                    usuario.setEstado(dir_estado);
                    usuario.setColonia(dir_colonia);
                    usuario.setReferencias(dir_referencias);
                    usuario.setMunicipio(dir_municipio);
                    usuario.setCodigoPostal(cp);
                    usuario.setRol(Long.parseLong(rol));
                    ResultAction registrarAct = serviceUsuario.registrar(usuario);
                    urlRedirect = "/gestionUsuarios?result=" +
                            registrarAct.isResult() + "&message=" + registrarAct.getMessage()
                            + "&status=" + registrarAct.getStatus();
                } catch (Exception e) {
                    urlRedirect = "/gestionUsuarios?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/actualizarUsuario":
                try {
                    String id_usuario = request.getParameter("id_usuario");
                    String nombre = request.getParameter("nombre");
                    String apellido_paterno = request.getParameter("apellido_paterno");
                    String apellido_materno = request.getParameter("apellido_materno");
                    String telefono = request.getParameter("telefono");
                    String dir_calle = request.getParameter("dir_calle");
                    String dir_estado = request.getParameter("dir_estado");
                    String dir_colonia = request.getParameter("dir_colonia");
                    String dir_referencias = request.getParameter("dir_referencias");
                    String dir_municipio = request.getParameter("dir_municipio");
                    String cp = request.getParameter("cp");
                    BeanUsuario usuario = new BeanUsuario();
                    usuario.setId_usuario(Long.parseLong(id_usuario));
                    usuario.setNombre(nombre);
                    usuario.setApellido_paterno(apellido_paterno);
                    usuario.setApellido_materno(apellido_materno);
                    usuario.setTelefono(telefono);
                    usuario.setCalle(dir_calle);
                    usuario.setEstado(dir_estado);
                    usuario.setColonia(dir_colonia);
                    usuario.setReferencias(dir_referencias);
                    usuario.setMunicipio(dir_municipio);
                    usuario.setCodigoPostal(cp);
                    ResultAction verificarAct = serviceUsuario.actualizar(usuario);
                    urlRedirect = "/gestionUsuarios?result=" +
                            verificarAct.isResult() + "&message=" + verificarAct.getMessage()
                            + "&status=" + verificarAct.getStatus();
                } catch (Exception e) {
                    urlRedirect = "/gestionUsuarios?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/guardarUsuario":
                try {
                    HttpSession sesion = request.getSession();
                    String id_usuario = sesion.getAttribute("id").toString();
                    String nombre = request.getParameter("nombre");
                    String apellido_paterno = request.getParameter("apellido_paterno");
                    String apellido_materno = request.getParameter("apellido_materno");
                    String telefono = request.getParameter("telefono");
                    String dir_calle = request.getParameter("dir_calle");
                    String dir_estado = request.getParameter("dir_estado");
                    String dir_colonia = request.getParameter("dir_colonia");
                    String dir_referencias = request.getParameter("dir_referencias");
                    String dir_municipio = request.getParameter("dir_municipio");
                    String cp = request.getParameter("cp");
                    BeanUsuario usuario = new BeanUsuario();
                    usuario.setId_usuario(Long.parseLong(id_usuario));
                    usuario.setNombre(nombre);
                    usuario.setApellido_paterno(apellido_paterno);
                    usuario.setApellido_materno(apellido_materno);
                    usuario.setTelefono(telefono);
                    usuario.setCalle(dir_calle);
                    usuario.setEstado(dir_estado);
                    usuario.setColonia(dir_colonia);
                    usuario.setReferencias(dir_referencias);
                    usuario.setMunicipio(dir_municipio);
                    usuario.setCodigoPostal(cp);
                    ResultAction verificarAct = serviceUsuario.actualizar(usuario);
                    urlRedirect = "/usuario?result=" +
                            verificarAct.isResult() + "&message=" + verificarAct.getMessage()
                            + "&status=" + verificarAct.getStatus();
                } catch (Exception e) {
                    urlRedirect = "/usuario?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/enviarCodigo":
                try {
                    String correo = null;
                    if (request.getParameter("correo") != null) {
                        correo = request.getParameter("correo");
                    } else {
                        urlRedirect = "/recuperar?result=false&message=Error%20de%20servidor&status=500";
                    }
                    ResultAction result_check = serviceUsuario.enviarCodigoCorreo(correo);//
                    if (result_check.isResult()) {
                        sesion = request.getSession();
                        BeanUsuario usuario = serviceUsuario.getUsuario(correo);
                        sesion.setMaxInactiveInterval(86400); //24 horas max
                        sesion.setAttribute("id_recu", usuario.getId_usuario());
                        urlRedirect = "/confirmar";
                    } else {
                        urlRedirect = "/recuperar?result=" +
                                result_check.isResult() + "&message=" + result_check.getMessage()
                                + "&status=" + result_check.getStatus();
                    }
                } catch (Exception e) {
                    urlRedirect = "/recuperar?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/validarCodigo":
                try {
                    sesion = request.getSession();
                    String id_usr = null;
                    if (sesion.getAttribute("id_recu") != null) {
                        id_usr = sesion.getAttribute("id_recu").toString();
                    } else {
                        urlRedirect = "/recuperar?result=false&message=C%C3%B3digo%20caducado&status=500";
                    }
                    String codigo = request.getParameter("codigo");
                    ResultAction result_check = serviceUsuario.verificarCodigo(Long.parseLong(id_usr), codigo);//verificamos el codigo
                    if (result_check.isResult()) {
                        sesion.setMaxInactiveInterval(86400); //24 horas max
                        sesion.setAttribute("cod", codigo);
                        urlRedirect = "/cambiarContra";
                    } else {
                        urlRedirect = "/confirmar?result=" +
                                result_check.isResult() + "&message=" + result_check.getMessage()
                                + "&status=" + result_check.getStatus();
                    }
                } catch (Exception e) {
                    urlRedirect = "/recuperar?result=false&message=C%C3%B3digo%20caducado&status=500";
                }
                break;
            case "/recuperarContra":
                try {
                    sesion = request.getSession();
                    String id_usr = null;
                    if (sesion.getAttribute("id_recu") != null) {
                        id_usr = sesion.getAttribute("id_recu").toString();
                    } else {
                        urlRedirect = "/recuperar?result=false&message=C%C3%B3digo%20caducado&status=500";
                    }
                    String n_contrasena = request.getParameter("n_contrasena");
                    ResultAction result_check = serviceUsuario.recuperarContra(Long.parseLong(id_usr), n_contrasena);//Cambiamos la contraseña
                    if (result_check.isResult()) {
                        urlRedirect = "/ingreso?result=" +
                                result_check.isResult() + "&message=" + result_check.getMessage()
                                + "&status=" + result_check.getStatus();
                    } else {
                        urlRedirect = "/ingreso?result=" +
                                result_check.isResult() + "&message=" + result_check.getMessage()
                                + "&status=" + result_check.getStatus();
                    }
                } catch (Exception e) {
                    urlRedirect = "/recuperar?result=false&message=C%C3%B3digo%20caducado&status=500";
                }
                break;
            case "/guardarContra":
                try {
                    sesion = request.getSession();
                    String n_contrasena = request.getParameter("n_contrasena");
                    String contrasena = request.getParameter("contrasena");
                    String id_usr = sesion.getAttribute("id").toString();
                    String correo = sesion.getAttribute("correo").toString();
                    ResultAction result_verf = serviceUsuario.ingresar(correo,contrasena);
                    ResultAction result_check = serviceUsuario.cambiarContra(Long.parseLong(id_usr), n_contrasena, contrasena);//Cambiamos la contraseña
                    if (result_check.isResult() && result_verf.isResult()) {
                        urlRedirect = "/usuario?result=" +
                                result_check.isResult() + "&message=" + result_check.getMessage()
                                + "&status=" + result_check.getStatus();
                    } else {
                        urlRedirect = "/usuario?result=" +
                                result_verf.isResult() + "&message=" + result_verf.getMessage()
                                + "&status=" + result_verf.getStatus();
                    }
                } catch (Exception e) {
                    urlRedirect = "/usuario?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            case "/eliminarUsuario":
                try {
                    sesion = request.getSession();
                    String rol_ejecutante = sesion.getAttribute("rol").toString();
                    String id = request.getParameter("id");
                    ResultAction result3 = serviceUsuario.eliminar(Long.parseLong(id), Long.parseLong(rol_ejecutante));
                    urlRedirect = "/gestionUsuarios?result=" +
                            result3.isResult() + "&message=" + URLEncoder.encode(result3.getMessage(), StandardCharsets.UTF_8.name())
                            + "&status=" + result3.getStatus();
                } catch (Exception e) { // handle your exception
                    urlRedirect = "/gestionUsuarios?result=false&message=Error%20de%20servidor&status=500";
                }
                break;
            default:
                urlRedirect = "/menu";
                break;
        }
        response.sendRedirect(request.getContextPath() + urlRedirect);
    }
}
