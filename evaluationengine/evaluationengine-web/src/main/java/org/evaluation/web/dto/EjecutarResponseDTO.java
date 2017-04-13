package org.evaluation.web.dto;

import java.io.Serializable;
import java.util.LinkedList;

public class EjecutarResponseDTO implements Serializable{

	private static final long serialVersionUID = 1398201254735262599L;
    
	private boolean error=false;
	private String msgError;
	private LinkedList<EjecutarResultadoDTO> lst= new LinkedList<EjecutarResultadoDTO>();

    public String getMsgError() {
		return msgError;
	}

	public void setMsgError(String msgError) {
		this.msgError = msgError;
	}

    
	public LinkedList<EjecutarResultadoDTO> getLst() {
		return lst;
	}

	public void setLst(LinkedList<EjecutarResultadoDTO> lst) {
		this.lst = lst;
	}

	public boolean isError() {
		return error;
	}

	public void setError(boolean error) {
		this.error = error;
	}
}
