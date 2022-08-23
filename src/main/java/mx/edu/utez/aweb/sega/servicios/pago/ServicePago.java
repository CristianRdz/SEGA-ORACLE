package mx.edu.utez.aweb.sega.servicios.pago;

import mx.edu.utez.aweb.sega.modelo.catalogo.BeanCatalogo;
import mx.edu.utez.aweb.sega.modelo.pago.BeanPago;
import mx.edu.utez.aweb.sega.modelo.pago.DaoPago;
import mx.edu.utez.aweb.sega.utiles.ResultAction;

import java.util.List;

public class ServicePago {

    DaoPago daoPago= new DaoPago();

    public List<BeanPago> getAll(long id_usr,long rol) {
        return daoPago.findAll(id_usr,rol);
    }

    public ResultAction accionarPago(long id_usuario,long rol,long id_revision,long id_pago){
        ResultAction result= new ResultAction();
        if(daoPago.accionarPago(id_usuario,rol,id_revision,id_pago)){
            result.setResult(true);
            result.setMessage("Accion correcta");
            result.setStatus(200);
        }else{
            result.setResult(false);
            result.setMessage("Ocurrio un error");
            result.setStatus(400);
        }
        return result;
    }
}
