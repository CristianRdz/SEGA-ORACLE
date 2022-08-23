package mx.edu.utez.aweb.sega.servicios.historial_rev;

import mx.edu.utez.aweb.sega.modelo.auto.BeanAuto;
import mx.edu.utez.aweb.sega.modelo.historial_rev.BeanHistorial_rev;
import mx.edu.utez.aweb.sega.modelo.historial_rev.DaoHistorial_rev;
import mx.edu.utez.aweb.sega.modelo.revision.BeanControl;
import mx.edu.utez.aweb.sega.utiles.ResultAction;

import java.util.List;

public class ServiceHistorial_rev {

    DaoHistorial_rev daoHistorialRev = new DaoHistorial_rev();

    public List<BeanHistorial_rev> getHistCat(long id_rev) {
        return daoHistorialRev.verHistCat(id_rev);
    }

    public List<BeanControl> getHistorial(long id_usr, long rol) {
        return daoHistorialRev.verHistorial(id_usr, rol);
    }

    public BeanHistorial_rev getElmHistCat(long id_hist) {
        return daoHistorialRev.findOne(id_hist);
    }

    public BeanControl getControl(long id_usr, long rol, long id_rev) {
        return daoHistorialRev.findOneControl(id_usr, rol, id_rev);
    }

    public String getTotal(Long id_rev) {
        if (daoHistorialRev.obtenerTotal(id_rev)!=null){
            return daoHistorialRev.obtenerTotal(id_rev);
        }
        return "0.0";
    }
}
