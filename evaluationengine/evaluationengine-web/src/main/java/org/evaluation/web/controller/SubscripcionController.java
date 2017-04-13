package org.evaluation.web.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.codehaus.groovy.control.CompilerConfiguration;
import org.evaluation.web.dto.CargarResponseDTO;
import org.evaluation.web.dto.EjecutarDTO;
import org.evaluation.web.dto.EjecutarResponseDTO;
import org.evaluation.web.dto.EjecutarResultadoDTO;
import org.evaluation.web.dto.SolicitudDTO;
import org.evaluation.web.dto.SubscripcionDTO;
import org.evaluation.web.rule.IVARule;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import groovy.lang.Binding;
import groovy.lang.GroovyShell;
import groovy.lang.Script;

@RestController
public class SubscripcionController {
	private static final Logger LOGGER = LoggerFactory.getLogger(SubscripcionController.class);

	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public ModelAndView initial() {
		LOGGER.debug("------init---------");
		return new ModelAndView("initial", "command", new String());
	}

	@RequestMapping(value = "/dynamic", method = RequestMethod.GET)
	public ModelAndView dinamico() {
		LOGGER.debug("------init---------");
		return new ModelAndView("dynamic", "command", new String());
	}
	
	@RequestMapping(value = "/subs", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody SubscripcionDTO getContributionPayload() {
		SubscripcionDTO subscripcionDTO = new SubscripcionDTO();
		subscripcionDTO.setMessageUUID(UUID.randomUUID().toString());
		subscripcionDTO.setFechaActual(new Date());
		return subscripcionDTO;
	}

	@RequestMapping(value = "/cargar", method = RequestMethod.POST)
	public @ResponseBody CargarResponseDTO cargar(@RequestBody SolicitudDTO solicitudDTO) {
		LOGGER.debug("solicitud=" + solicitudDTO.toString());
		CargarResponseDTO cargarResponseDTO = new CargarResponseDTO();
		cargarResponseDTO.setCodigo(obtenerMatrizCalculo(solicitudDTO));
		return cargarResponseDTO;
	}

	@RequestMapping(value = "/ejecutar", method = RequestMethod.POST)
	public @ResponseBody EjecutarResponseDTO ejecutar(@RequestBody EjecutarDTO ejecutarDTO) {
		EjecutarResponseDTO ejecutarResponseDTO = new EjecutarResponseDTO();
		Binding binding = new Binding();
		CompilerConfiguration compilerConfiguration = new CompilerConfiguration();
		compilerConfiguration.setScriptBaseClass(IVARule.class.getName());
		GroovyShell shell = new GroovyShell(this.getClass().getClassLoader(), binding, compilerConfiguration);
		LOGGER.debug("ejecutarDTO=" + ejecutarDTO.getEvaluacionSourceCode());
		Script sc = shell.parse(ejecutarDTO.getEvaluacionSourceCode());
		try {
			Object lstRun = sc.run();
			if (lstRun instanceof List) {
				List<Object> salida = (List<Object>) lstRun;
				for (Object numero : salida) {
					EjecutarResultadoDTO ejecutarResultadoDTO = new EjecutarResultadoDTO();
					if (numero instanceof Integer) {
						ejecutarResultadoDTO.setValor(((Integer) numero).toString());

					} else if (numero instanceof BigDecimal) {
						ejecutarResultadoDTO.setValor(((BigDecimal) numero).toEngineeringString());
					}
					ejecutarResponseDTO.getLst().add(ejecutarResultadoDTO);

				}
			} else if (lstRun instanceof Integer) {
				EjecutarResultadoDTO ejecutarResultadoDTO = new EjecutarResultadoDTO();

				ejecutarResultadoDTO.setValor(((Integer) lstRun).toString());
				ejecutarResponseDTO.getLst().add(ejecutarResultadoDTO);

			} else if (lstRun instanceof Integer) {
				EjecutarResultadoDTO ejecutarResultadoDTO = new EjecutarResultadoDTO();
				ejecutarResultadoDTO.setValor(((Integer) lstRun).toString());
				ejecutarResponseDTO.getLst().add(ejecutarResultadoDTO);
			}

		} catch (Exception ex) {
			ejecutarResponseDTO.setError(true);
			ejecutarResponseDTO.setMsgError(ex.getMessage());
		}

		return ejecutarResponseDTO;
	}
    
	public String obtenerMatrizCalculo(SolicitudDTO solicitudDTO) {
		StringBuilder sb = new StringBuilder();
		int id = solicitudDTO.getSelectedFuncion().getId();
		switch (id) {
		case 0:
			sb.append("def calculo() { \n ");
			sb.append(" x=0.0; \n ");
			sb.append(" y=1.1; \n ");
			sb.append(" Z=1.1*x+y; \n ");
			break;
		case 1:
			sb.append(" x=2.4;  \n ");
			sb.append(" y=3.5;  \n ");
			break;
		}
		sb.append("return [x,y]; };  \ncalculo();");
		return sb.toString();
	}

}
