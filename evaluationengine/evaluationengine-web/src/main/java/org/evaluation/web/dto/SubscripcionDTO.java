package org.evaluation.web.dto;

import java.io.Serializable;
import java.util.Date;

public class SubscripcionDTO implements Serializable {

	private static final long serialVersionUID = 3507978512040076820L;
	public String getMessageUUID() {
		return messageUUID;
	}
	public void setMessageUUID(String messageUUID) {
		this.messageUUID = messageUUID;
	}
	public Date getFechaActual() {
		return fechaActual;
	}
	public void setFechaActual(Date fechaActual) {
		this.fechaActual = fechaActual;
	}
	private String messageUUID;
	private Date fechaActual;
	

}
