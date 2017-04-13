package org.evaluation.web.dto;


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
"id",
"tag",
"$$hashKey"
})
public class SelectedRegion {

@JsonProperty("id")
private Integer id;
@JsonProperty("tag")
private String tag;
@JsonProperty("$$hashKey")
private String $$hashKey;
@JsonIgnore
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

/**
* 
* @return
* The id
*/
@JsonProperty("id")
public Integer getId() {
return id;
}

/**
* 
* @param id
* The id
*/
@JsonProperty("id")
public void setId(Integer id) {
this.id = id;
}

/**
* 
* @return
* The tag
*/
@JsonProperty("tag")
public String getTag() {
return tag;
}

/**
* 
* @param tag
* The tag
*/
@JsonProperty("tag")
public void setTag(String tag) {
this.tag = tag;
}

/**
* 
* @return
* The $$hashKey
*/
@JsonProperty("$$hashKey")
public String get$$hashKey() {
return $$hashKey;
}

/**
* 
* @param $$hashKey
* The $$hashKey
*/
@JsonProperty("$$hashKey")
public void set$$hashKey(String $$hashKey) {
this.$$hashKey = $$hashKey;
}

@JsonAnyGetter
public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

@JsonAnySetter
public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

}