package org.evaluation.web.dto;

import java.io.Serializable;

public class CargarResponseDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7219278595629232185L;

	
	private String codigo;


	public String getCodigo() {
		return codigo;
	}


	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
}
