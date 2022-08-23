package mx.edu.utez.aweb.sega.servicios.revision;

import mx.edu.utez.aweb.sega.modelo.historial_rev.BeanHistorial_rev;
import mx.edu.utez.aweb.sega.modelo.historial_rev.DaoHistorial_rev;
import mx.edu.utez.aweb.sega.modelo.revision.BeanControl;
import mx.edu.utez.aweb.sega.modelo.revision.BeanRevision;
import mx.edu.utez.aweb.sega.modelo.revision.DaoRevision;
import mx.edu.utez.aweb.sega.modelo.usuario.BeanUsuario;
import mx.edu.utez.aweb.sega.utiles.EmailSend;
import mx.edu.utez.aweb.sega.utiles.ResultAction;

import java.util.List;
import java.util.Random;

public class ServiceRevision {
    DaoRevision daoRevision = new DaoRevision();
    DaoHistorial_rev daoHistRev = new DaoHistorial_rev();

    public List<BeanRevision> getAll(long id_usr, long rol) {
        return daoRevision.findAll(id_usr, rol);
    }

    public BeanRevision getRev(long id_usr, long rol, long id_rev) {
        return daoRevision.findOne(id_usr, rol, id_rev);
    }



    public ResultAction cancelar(long id_rev, long rol, long id) {
        ResultAction result = new ResultAction();
        if (daoRevision.cancelarRev(id_rev, rol, id)) {
            result.setResult(true);
            result.setMessage("Revisión cancelada correctamente");
            result.setStatus(200);
        } else {

            result.setResult(false);
            result.setMessage("Ocurrio un error al cancelar");
            result.setStatus(400);
        }
        return result;
    }

    //SET @p0='1'; SET @p1='1'; SET @p2='2'; CALL `eliminarRevision`(@p0, @p1, @p2);
    public ResultAction crear(String matricula, long id_usr, long rol) {
        ResultAction result = new ResultAction();
        if (daoRevision.crear(matricula, id_usr, rol)) {
            result.setResult(true);
            result.setMessage("Revisión creada correctamente");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("Ocurrio un error al crear...");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction cambiarFase(long id_usr, long rol, long id_rev, String fase) {
        ResultAction result = new ResultAction();
        //SET @p0='2'; SET @p1='5'; SET @p2='1'; CALL `obtenerControl`(@p0, @p1, @p2);
        if (daoRevision.cambiarFase(id_usr,rol,id_rev,fase)) {
            result.setResult(true);
            result.setMessage("Correo enviado");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("Correo no enviado...");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction agregarHist(long id_rev, long id_elm, String observaciones, long cantidad) {
        ResultAction result = new ResultAction();
        if (daoRevision.agregarHist(id_rev, id_elm, observaciones, cantidad)) {
            result.setResult(true);
            result.setMessage("Elemento agregado correctamente");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("No hay existencias suficientes...");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction modificarHist(long id_rev, long id_hist, long nuevaCantidad) {
        ResultAction result = new ResultAction();
        if (daoRevision.actualizarHist(id_rev,id_hist,nuevaCantidad)) {
            result.setResult(true);
            result.setMessage("Elemento modificado correctamente");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("No hay existencias suficientes");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction eliminarHist(long id_rev, long id_hist) {
        ResultAction result = new ResultAction();
        if (daoRevision.eliminarHist(id_rev,id_hist)) {
            result.setResult(true);
            result.setMessage("Elemento eliminado correctamente");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("Ocurrio un error al eliminar...");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction actualizar(long id_usr, long rol, long id_rev, String fase, String observaciones){
        ResultAction result = new ResultAction();
        if (daoRevision.actualizar(id_usr,rol,id_rev,fase,observaciones)) {
            result.setResult(true);
            result.setMessage("Revisión actualizada correctamente");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("Ocurrio un error al actualizar...");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction eliminar(long id_usr, long rol, long id_rev){
        ResultAction result = new ResultAction();
        if (daoRevision.eliminar(id_usr,rol,id_rev)) {
            result.setResult(true);
            result.setMessage("Revisión eliminada correctamente");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("Ocurrio un error al eliminar...");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction finalizar(long id_rev){
        ResultAction result = new ResultAction();
        if (daoRevision.finalizarRev(id_rev)) {
            result.setResult(true);
            result.setMessage("Revisión finalizada correctamente");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("Ocurrio un error al finalizar...");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction enviarCorreo(long id_usr, long rol, long id_rev, String fase) {
        ResultAction result = new ResultAction();
        //SET @p0='2'; SET @p1='5'; SET @p2='1'; CALL `obtenerControl`(@p0, @p1, @p2);
        if (daoHistRev.findOneControl(id_usr,rol,id_rev)!= null) {
            EmailSend emailSend = new EmailSend();
            BeanControl control =  daoHistRev.findOneControl(id_usr,rol,id_rev);
            String email =control.getCorreo();
            String auto =control.getMarca()+" "+control.getModelo();
            emailSend.Enviar(email, "Actualización de revisión: "+fase+"", "Tu "+auto+" ha cambiado a la siguiente fase de revisión:<br>" +
                    "<div style='margin:2%; border:2px solid green; background-color: lightgreen; text-align: center; border-radius: 20px;'>"
                    + fase + "</div>");
            result.setResult(true);
            result.setMessage("Correo enviado");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("Correo no enviado...");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction enviarCorreoMod(long id_usr, long rol, long id_rev, String fase) {
        ResultAction result = new ResultAction();
        //SET @p0='2'; SET @p1='5'; SET @p2='1'; CALL `obtenerControl`(@p0, @p1, @p2);
        if (daoHistRev.findOneControl(id_usr,rol,id_rev)!= null) {
            EmailSend emailSend = new EmailSend();
            BeanControl control =  daoHistRev.findOneControl(id_usr,rol,id_rev);
            String email =control.getCorreo();
            String auto =control.getMarca()+" "+control.getModelo();
            emailSend.Enviar(email, "Actualización de revisión corregida: "+fase+"", "Se ha corregido la fase de revisión en tu "+auto+":<br>" +
                    "<div style='margin:2%; border:2px solid green; background-color: lightgreen; text-align: center; border-radius: 20px;'>"
                    + fase + "</div>");
            result.setResult(true);
            result.setMessage("Correo enviado");
            result.setStatus(200);
        } else {
            result.setResult(false);
            result.setMessage("Correo no enviado...");
            result.setStatus(400);
        }
        return result;
    }

}
