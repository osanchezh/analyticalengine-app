package org.evaluation.web.rule;

import java.math.BigDecimal;

import org.evaluation.web.util.MathUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import groovy.lang.Script;

public class MonedaRule  extends Script{
	private static final Logger LOGGER =LoggerFactory.getLogger(MonedaRule.class);

	public BigDecimal DOLLAR(String nacion, BigDecimal valor){
		LOGGER.debug("nacion="+nacion);
		double dollar = MathUtil.getRandom(18.01, 22.01);
        BigDecimal valorReal = BigDecimal.ZERO;
		if(nacion.equals("MX")){
			LOGGER.debug("T1");
			valorReal = valorReal.add(new BigDecimal(dollar));
		}
		return valorReal;
	}
	@Override
	public Object run() {
		// TODO Auto-generated method stub
		return null;
	}

}
