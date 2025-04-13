package dao;

import java.util.List;
import models.Suscripcion;

public interface SuscripcionMapper {
    List<Suscripcion> listarSuscripciones();
    Suscripcion obtenerPorId(int id);
}
