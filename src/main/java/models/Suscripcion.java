package models;

import java.sql.Timestamp;

public class Suscripcion {

    private Integer idSuscripcion;
    private String tipo;
    private Float precio;
    private Integer duracionMeses;
    private String beneficios;

    // Getters y Setters
    public Integer getIdSuscripcion() {
        return idSuscripcion;
    }

    public void setIdCliente(Integer idSuscripcion) {
        this.idSuscripcion = idSuscripcion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }

    public Integer getDuracionMeses() {
        return duracionMeses;
    }

    public void setDuracionMeses(Integer duracionMeses) {
        this.duracionMeses = duracionMeses;
    }

    public String getBeneficios() {
        return beneficios;
    }

    public void setBeneficios(String beneficios) {
        this.beneficios = beneficios;
    }
}