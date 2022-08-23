package mx.edu.utez.aweb.sega.servicios.usuario;

import java.util.List;
import java.util.Random;

import mx.edu.utez.aweb.sega.modelo.usuario.BeanUsuario;
import mx.edu.utez.aweb.sega.modelo.usuario.DaoUsuario;
import mx.edu.utez.aweb.sega.utiles.EmailSend;
import mx.edu.utez.aweb.sega.utiles.ResultAction;

public class ServiceUsuario {
    DaoUsuario daoUsuario= new DaoUsuario();

    public List<BeanUsuario> getAll() {
        return daoUsuario.findAll();
    }

    public BeanUsuario getUsuario (String email){
        return daoUsuario.findOne(email);
    }

    public ResultAction ingresar(String email, String pass) {
        ResultAction result= new ResultAction();
        if(daoUsuario.acceso(email,pass)){
            result.setResult(true);
            result.setMessage("Acceso correcto");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Contrase%C3%B1a incorrecta...");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction verificarCodigo(Long id_usr, String codigo) {
        ResultAction result= new ResultAction();
        if(daoUsuario.verificarCodigo(id_usr,codigo)){
            result.setResult(true);
            result.setMessage("C%C3%B3digo verificado");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("C%C3%B3digo incorrecto...");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction agregarCodigo(Long id_usr, String codigo) {
        ResultAction result= new ResultAction();
        if(daoUsuario.agregarCodigo(id_usr,codigo)){
            result.setResult(true);
            result.setMessage("C%C3%B3digo agregado");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("C%C3%B3digo no agregado");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction recuperarContra(Long id_usr, String n_contrasena) {
        ResultAction result= new ResultAction();
        if(daoUsuario.recuContra(id_usr,n_contrasena)){
            result.setResult(true);
            result.setMessage("Contrase%C3%B1a recuperada exitosamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al actualizar");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction cambiarContra(Long id_usr, String n_contrasena, String contrasena) {
        ResultAction result= new ResultAction();
        if(daoUsuario.cambiarContra(id_usr,n_contrasena,contrasena)){
            result.setResult(true);
            result.setMessage("Contrase%C3%B1a actualizada");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al actualizar");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction buscar(String email) {
        ResultAction result= new ResultAction();
        if(daoUsuario.findOne(email)!=null){
            result.setResult(true);
            result.setMessage("Usuario encontrado");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Usuario inexistente...");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction buscarPorRfc(String rfc) {
        ResultAction result= new ResultAction();
        if(daoUsuario.findOneRfc(rfc)!=null){
            result.setResult(true);
            result.setMessage("Usuario encontrado");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Usuario inexistente...");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction enviarCodigoCorreo(String email) {
        ResultAction result= new ResultAction();
        if(daoUsuario.findOne(email)!=null){
            Random numAleatorio = new Random();
            int cod_verf = numAleatorio.nextInt(99999 - 10000 + 1) + 10000;
            EmailSend emailSend = new EmailSend();
            BeanUsuario usuario = getUsuario(email);
            emailSend.Enviar(email,
                    cod_verf + " es el código de recuperación de tu cuenta", "Ingresa el siguiente código para restablecer la contraseña:<br>" +
                            "<div style='margin:2%; border:2px solid blue; background-color: lightblue; text-align: center; border-radius: 20px;'>"
                            + cod_verf + "</div>");
            ResultAction result_save = agregarCodigo(usuario.getId_usuario(), String.valueOf(cod_verf));//Guardar en bd
            result.setResult(true);
            result.setMessage("Correo enviado");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Usuario inexistente...");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction actualizar(BeanUsuario usuario){
        ResultAction result= new ResultAction();
        if(daoUsuario.actualizarUsuario(usuario)){
            result.setResult(true);
            result.setMessage("Usuario actualizado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al actualizar");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction registrar(BeanUsuario usuario){
        ResultAction result= new ResultAction();
        if(daoUsuario.crearUsuario(usuario)){
            result.setResult(true);
            result.setMessage("Usuario registrado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al registrar");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction eliminar(Long id_usr, Long rol) {
        ResultAction result= new ResultAction();
        if(daoUsuario.eliminar(id_usr,rol)){
            result.setResult(true);
            result.setMessage("Usuario eliminar correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al eliminar");
            result.setStatus(400);
        }
        return result;
    }
}
