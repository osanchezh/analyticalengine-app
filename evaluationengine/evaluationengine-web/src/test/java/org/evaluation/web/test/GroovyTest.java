package org.evaluation.web.test;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.groovy.control.CompilerConfiguration;
import org.evaluation.web.rule.IVARule;
import org.evaluation.web.rule.MonedaRule;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import groovy.lang.Binding;
import groovy.lang.GroovyShell;
import groovy.lang.Script;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class GroovyTest {
	private static final Logger LOGGER =LoggerFactory.getLogger(GroovyTest.class);

   @Test
   public void math(){
	    LOGGER.debug("t1");
	    for( int i=0;i<1;i++){
	    Binding binding = new Binding();
	    CompilerConfiguration compilerConfiguration = new CompilerConfiguration();
	    compilerConfiguration.setScriptBaseClass(IVARule.class.getName());
	    compilerConfiguration.setScriptBaseClass(MonedaRule.class.getName());

	    String processingCode = "def calculo() {  x= 1; a=DOLLAR('MX',123.45); y=a*2; return [x,a,y]; }; calculo();";
	    GroovyShell shell = new GroovyShell(this.getClass().getClassLoader(), binding,compilerConfiguration);
	    binding.setVariable("ab", new BigDecimal(123.345));
	    long tiempoinicio = System.currentTimeMillis();
	    Script sc = shell.parse(processingCode);
	    LOGGER.debug("t1.1");
	    /*
	    Map<String, BigDecimal>  variable = sc.getBinding().getVariables();
	    for (Map.Entry<String, BigDecimal> entry : variable.entrySet()) {
	    	System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue());
	    }*/
	    List<BigDecimal> salida = (List<BigDecimal>)sc.run();
	    //List<BigDecimal> salida = (List<BigDecimal>)shell.evaluate(processingCode);
	    LOGGER.debug("salida="+ StringUtils.collectionToCommaDelimitedString(salida));
	    long tiempofin = System.currentTimeMillis();
	    LOGGER.debug("TIEMPO="+(tiempofin-tiempoinicio));
	    }


   }
}
