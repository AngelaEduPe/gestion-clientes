package models;

import java.sql.Timestamp;

public class Suscripcion {

    private Integer idCliente;
    private String tipo;
    private Float precio;
    private Timestamp duracionMeses;
    private String beneficios;

    // Getters y Setters
    public Integer getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
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

    public Timestamp getDuracionMeses() {
        return duracionMeses;
    }

    public void setDuracionMeses(Timestamp duracionMeses) {
        this.duracionMeses = duracionMeses;
    }

    public String getBeneficios() {
        return beneficios;
    }

    public void setBeneficios(String beneficios) {
        this.beneficios = beneficios;
    }
}