package models;

import java.sql.Timestamp;

public class EvaluacionFisica {

    private Integer idEvaluacion;
    private Integer idCliente;
    private Float peso;
    private Float altura;
    private Float grasaCorporal;
    private Float masaMuscular;
    private Timestamp fechaEvaluacion;

    // Getters y Setters
    public Integer getIdEvaluacion() {
        return idEvaluacion;
    }

    public void setIdEvaluacion(Integer idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }

    public Integer getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

    public Float getPeso() {
        return peso;
    }

    public void setPeso(Float peso) {
        this.peso = peso;
    }

    public Float getAltura() {
        return altura;
    }

    public void setAltura(Float altura) {
        this.altura = altura;
    }

    public Float getGrasaCorporal() {
        return grasaCorporal;
    }

    public void setGrasaCorporal(Float grasaCorporal) {
        this.grasaCorporal = grasaCorporal;
    }

    public Float getMasaMuscular() {
        return masaMuscular;
    }

    public void setMasaMuscular(Float masaMuscular) {
        this.masaMuscular = masaMuscular;
    }

    public Timestamp getFechaEvaluacion() {
        return fechaEvaluacion;
    }

    public void setFechaEvaluacion(Timestamp fechaEvaluacion) {
        this.fechaEvaluacion = fechaEvaluacion;
    }
}
