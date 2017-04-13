package org.evaluation.web.rule;
import java.math.BigDecimal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import groovy.lang.Script;

public class IVARule extends Script {
	private static final Logger LOGGER =LoggerFactory.getLogger(IVARule.class);

    public BigDecimal IVA(BigDecimal numero){
    	LOGGER.debug("calculo.iva");
    	return numero.multiply(new BigDecimal(0.16));
    }    
	
	@Override
	public Object run() {
    	LOGGER.debug("calculo.iva.run");

		// TODO Auto-generated method stub
		return null;
	}

}
