package models;

import java.sql.Timestamp;

public class Oportunidad {
    private Integer idOportunidad;
    private Cliente cliente; // Relación con Cliente
    private String estado;
    private Double montoEstimado;
    private Timestamp fechaCierre;

    public Integer getIdOportunidad() {
        return idOportunidad;
    }

    public void setIdOportunidad(Integer idOportunidad) {
        this.idOportunidad = idOportunidad;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Double getMontoEstimado() {
        return montoEstimado;
    }

    public void setMontoEstimado(Double montoEstimado) {
        this.montoEstimado = montoEstimado;
    }

    public Timestamp getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(Timestamp fechaCierre) {
        this.fechaCierre = fechaCierre;
    }
}
