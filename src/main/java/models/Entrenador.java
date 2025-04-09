package models;

import java.sql.Timestamp;

public class Entrenador {

    private Integer idEntrenador;
    private String nombre;
    private String especialidad;
    private String telefono;
    private String email;
    private Timestamp fechaContratacion;

    // Getters y Setters
    public Integer getIdEntrenador() {
        return idEntrenador;
    }

    public void setIdEntrenador(Integer idEntrenador) {
        this.idEntrenador = idEntrenador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getFechaContratacion() {
        return fechaContratacion;
    }

    public void setFechaContratacion(Timestamp fechaContratacion) {
        this.fechaContratacion = fechaContratacion;
    }
}
