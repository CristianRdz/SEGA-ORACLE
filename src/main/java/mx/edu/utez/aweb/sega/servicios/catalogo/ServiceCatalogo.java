package mx.edu.utez.aweb.sega.servicios.catalogo;

import mx.edu.utez.aweb.sega.modelo.catalogo.BeanCatalogo;
import mx.edu.utez.aweb.sega.modelo.catalogo.DaoCatalogo;
import mx.edu.utez.aweb.sega.utiles.ResultAction;

import java.util.List;

public class ServiceCatalogo {
    DaoCatalogo daoCatalogo= new DaoCatalogo();

    public List<BeanCatalogo> getAll() {
        return daoCatalogo.findAll();
    }
    public BeanCatalogo getElemento (long id){
        return daoCatalogo.findOne(id);
    }

    public ResultAction registrar(BeanCatalogo elemento){
        ResultAction result= new ResultAction();
        if(daoCatalogo.crearElemento(elemento)){
            result.setResult(true);
            result.setMessage("Elemento registrado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al registrar");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction actualizar(BeanCatalogo elemento,long rol){
        ResultAction result= new ResultAction();
        if(daoCatalogo.actualizarElemento(elemento,rol)){
            result.setResult(true);
            result.setMessage("Elemento actualizado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al actualizar");
            result.setStatus(400);
        }
        return result;
    }

    public ResultAction eliminar(long id_elemento, long rol) {
        ResultAction result= new ResultAction();
        if(daoCatalogo.eliminar(id_elemento,rol)){
            result.setResult(true);
            result.setMessage("Elemento eliminado correctamente");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error al eliminar");
            result.setStatus(400);
        }
        return result;
    }

}
