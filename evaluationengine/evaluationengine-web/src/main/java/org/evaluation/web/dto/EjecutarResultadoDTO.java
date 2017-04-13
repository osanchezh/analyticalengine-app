package org.evaluation.web.dto;

import java.io.Serializable;

public class EjecutarResultadoDTO implements Serializable {
	private static final long serialVersionUID = 1325851392734460395L;
    private String valor;
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
}
