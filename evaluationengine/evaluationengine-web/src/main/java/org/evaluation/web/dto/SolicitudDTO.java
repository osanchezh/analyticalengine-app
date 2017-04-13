package org.evaluation.web.dto;

import java.io.Serializable;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("org.jsonschema2pojo")
@JsonPropertyOrder({
"selectedNombreProceso",
"selectedNombreOperacion",
"selectedUsuario",
"selectedRegion",
"generatedMessageUUID",
"selectedFuncion",
"selectedAccion"
})

public class SolicitudDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	

@JsonProperty("selectedNombreProceso")
private SelectedNombreProceso selectedNombreProceso;
@JsonProperty("selectedNombreOperacion")
private SelectedNombreOperacion selectedNombreOperacion;
@JsonProperty("selectedUsuario")
private SelectedUsuario selectedUsuario;
@JsonProperty("selectedRegion")
private SelectedRegion selectedRegion;
@JsonProperty("generatedMessageUUID")
private String generatedMessageUUID;
@JsonProperty("selectedFuncion")
private SelectedFuncion selectedFuncion;
@JsonProperty("selectedAccion")
private SelectedAccion selectedAccion;
@JsonIgnore
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

/**
* 
* @return
* The selectedNombreProceso
*/
@JsonProperty("selectedNombreProceso")
public SelectedNombreProceso getSelectedNombreProceso() {
return selectedNombreProceso;
}

/**
* 
* @param selectedNombreProceso
* The selectedNombreProceso
*/
@JsonProperty("selectedNombreProceso")
public void setSelectedNombreProceso(SelectedNombreProceso selectedNombreProceso) {
this.selectedNombreProceso = selectedNombreProceso;
}

/**
* 
* @return
* The selectedNombreOperacion
*/
@JsonProperty("selectedNombreOperacion")
public SelectedNombreOperacion getSelectedNombreOperacion() {
return selectedNombreOperacion;
}

/**
* 
* @param selectedNombreOperacion
* The selectedNombreOperacion
*/
@JsonProperty("selectedNombreOperacion")
public void setSelectedNombreOperacion(SelectedNombreOperacion selectedNombreOperacion) {
this.selectedNombreOperacion = selectedNombreOperacion;
}

/**
* 
* @return
* The selectedUsuario
*/
@JsonProperty("selectedUsuario")
public SelectedUsuario getSelectedUsuario() {
return selectedUsuario;
}

/**
* 
* @param selectedUsuario
* The selectedUsuario
*/
@JsonProperty("selectedUsuario")
public void setSelectedUsuario(SelectedUsuario selectedUsuario) {
this.selectedUsuario = selectedUsuario;
}

/**
* 
* @return
* The selectedRegion
*/
@JsonProperty("selectedRegion")
public SelectedRegion getSelectedRegion() {
return selectedRegion;
}

/**
* 
* @param selectedRegion
* The selectedRegion
*/
@JsonProperty("selectedRegion")
public void setSelectedRegion(SelectedRegion selectedRegion) {
this.selectedRegion = selectedRegion;
}

/**
* 
* @return
* The generatedMessageUUID
*/
@JsonProperty("generatedMessageUUID")
public String getGeneratedMessageUUID() {
return generatedMessageUUID;
}

/**
* 
* @param generatedMessageUUID
* The generatedMessageUUID
*/
@JsonProperty("generatedMessageUUID")
public void setGeneratedMessageUUID(String generatedMessageUUID) {
this.generatedMessageUUID = generatedMessageUUID;
}

/**
* 
* @return
* The selectedFuncion
*/
@JsonProperty("selectedFuncion")
public SelectedFuncion getSelectedFuncion() {
return selectedFuncion;
}

/**
* 
* @param selectedFuncion
* The selectedFuncion
*/
@JsonProperty("selectedFuncion")
public void setSelectedFuncion(SelectedFuncion selectedFuncion) {
this.selectedFuncion = selectedFuncion;
}

/**
* 
* @return
* The selectedAccion
*/
@JsonProperty("selectedAccion")
public SelectedAccion getSelectedAccion() {
return selectedAccion;
}

/**
* 
* @param selectedAccion
* The selectedAccion
*/
@JsonProperty("selectedAccion")
public void setSelectedAccion(SelectedAccion selectedAccion) {
this.selectedAccion = selectedAccion;
}

@JsonAnyGetter
public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

@JsonAnySetter
public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

@Override
public String toString() {
	return "SolicitudDTO [selectedNombreProceso=" + selectedNombreProceso + ", selectedNombreOperacion="
			+ selectedNombreOperacion + ", selectedUsuario=" + selectedUsuario + ", selectedRegion=" + selectedRegion
			+ ", generatedMessageUUID=" + generatedMessageUUID + ", selectedFuncion=" + selectedFuncion
			+ ", selectedAccion=" + selectedAccion + ", additionalProperties=" + additionalProperties + "]";
}


}
