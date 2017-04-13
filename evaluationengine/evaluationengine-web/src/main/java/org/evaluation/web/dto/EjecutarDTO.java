package org.evaluation.web.dto;

import java.io.Serializable;

public class EjecutarDTO implements Serializable {

	private static final long serialVersionUID = 9191438007461219749L;

	private String evaluacionSourceCode;

	public String getEvaluacionSourceCode() {
		return evaluacionSourceCode;
	}

	public void setEvaluacionSourceCode(String evaluacionSourceCode) {
		this.evaluacionSourceCode = evaluacionSourceCode;
	}
}
