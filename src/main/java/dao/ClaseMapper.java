package dao;

import java.util.List;
import models.Clase;

public interface ClaseMapper {
    List<Clase> listarClases();
    Clase obtenerPorId(int id);
}
