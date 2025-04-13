package services;

import java.util.List;
import models.Suscripcion;

public interface SuscripcionService {
    List<Suscripcion> listarSuscripciones();
    Suscripcion obtenerPorId(int id);
}
