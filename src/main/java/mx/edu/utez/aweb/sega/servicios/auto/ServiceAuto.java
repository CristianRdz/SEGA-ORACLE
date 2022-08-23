package mx.edu.utez.aweb.sega.servicios.auto;

import mx.edu.utez.aweb.sega.modelo.auto.BeanAuto;
import mx.edu.utez.aweb.sega.modelo.auto.DaoAuto;
import mx.edu.utez.aweb.sega.utiles.ResultAction;
import java.util.List;

public class ServiceAuto {

    DaoAuto daoAuto= new DaoAuto();
    public List<BeanAuto> getAll() {
        return daoAuto.findAll();
    }

    public List<BeanAuto> verAutos(Long id,Long rol) {
        return daoAuto.verAutos(id,rol);
    }
    public BeanAuto getAuto (String matricula){
        return daoAuto.findOne(matricula);
    }
    public ResultAction registrar(BeanAuto auto){
        ResultAction result= new ResultAction();
        if(daoAuto.crearAuto(auto)){
            result.setResult(true);
            result.setMessage("Auto registrado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al registrar");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction actualizar(BeanAuto auto){
        ResultAction result= new ResultAction();
        if(daoAuto.actualizarAuto(auto)){
            result.setResult(true);
            result.setMessage("Auto actualizado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al actualizar");
            result.setStatus(400);
        }
        return result;
    }
    public ResultAction eliminar(String matricula, Long rol) {
        ResultAction result= new ResultAction();
        if(daoAuto.eliminar(matricula,rol)){
            result.setResult(true);
            result.setMessage("Auto eliminado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al eliminar");
            result.setStatus(400);
        }
        return result;
    }

}
