<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<html class="no-js" lang="es">
<head>
<meta http-equiv="Pragma" content="no-cache"></meta>
<meta charset="utf-8" content="text/html"></meta>
<meta http-equiv="content-type" content="text/html;charset=utf-8" /></meta>
<meta http-equiv="X-UA-Compatible" content="IE=8"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
<meta name="description" content="Prueba Webix"></meta>
<meta name="author" content="corporativo.enterprise.com"></meta>
<link type="text/css" rel="stylesheet" href="/libs/bootstrap/dist/css/paper.css" />
<link type="text/css" rel="stylesheet" href="/libs/toastr/toastr.css" />
        <!-- CODE Mirror -->
        <link href="/libs/codemirror/lib/codemirror.css" rel="stylesheet" type="text/css">


       
</head>
<body ng-app="evaluationEngineApp"
	ng-controller="evaluationEngineController">

	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="http://www.enterprise.com"> enterprise </a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">Motor de evaluacion</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="http://www.jquery2dotnet.com"
						class="dropdown-toggle" data-toggle="dropdown">Ayuda<b
							class="caret"></b></a>
						<ul class="dropdown-menu" style="padding: 15px; min-width: 250px;">
							<li>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<button type="submit" class="btn btn-success btn-block">Máquina
												Fiscal</button>
										</div>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li><input class="btn btn-primary btn-block" type="button"
								id="sign-in-google" value="Version Actual:1.0.0.0"></li>
						</ul></li>
				</ul>
			</div>

		</div>
		</nav>
	</div>
	<br />
	<br />
	<br />
	<div class="container">
		<div id="alert_message" class="alert alert-success alert-dismissible"
			role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>Revision</strong> de servicios activos.
		</div>
		<div class="row">
			<table class="table">
				<tr>

					<td>

						<form novalidate name="frmSeleccion" class="form-horizontal"
							role="form">
							<fieldset>
								<h3 class="subheader">
									1.<strong>Generador</strong> de formulas
								</h3>
							</fieldset>
							<div class="panel panel-info">
								<div class="panel-heading">1.1. Seleccion modulo</div>
								<div class="panel-body">
									<div class="form-group">
										<label id="spanTipoTramite" for="ddmMessageUUID"
											class="col-lg-2 control-label">A.1.Message UUID:</label>
										<div class="col-lg-10">
										  <p id="ddmMessageUUID" class="form-control-static mb-0">{{solicitud.generatedMessageUUID}}</p>
										</div>
									</div>

									<div class="form-group">
										<label id="spanNombreProceso" for="ddmNombreProceso"
											class="col-lg-2 control-label">A.2.Nombre de proceso:</label>
										<div class="col-lg-10">
									      <select id="ddmNombreProceso" 
									class="form-control btn-default  dropdown-toggle" 
  ng-options="nombreProceso.tag for nombreProceso in catalogo.lstNombreProceso " 
  ng-model="solicitud.selectedNombreProceso"></select>  
									    </div>

									</div>
									<div class="form-group">
										<label id="spanNombreOperacion" for="ddmNombreOperacion"
											class="col-lg-2 control-label">A.3.Nombre de operacion:</label>
										<div class="col-lg-10">
									      <select id="ddmNombreOperacion" 
									class="form-control btn-default  dropdown-toggle" 
  ng-options="nombreOperacion.tag for nombreOperacion in catalogo.lstNombreOperacion" 
  ng-model="solicitud.selectedNombreOperacion"></select>  										
										</div>
									</div>
									<div class="form-group">
										<label id="spanUsuario" for="ddmUsuario"
											class="col-lg-2 control-label">A.4.Usuario:</label>
										<div class="col-lg-10">
									      <select id="ddmUsuario" 
									class="form-control btn-default  dropdown-toggle" 
  ng-options="usuario.tag for usuario in catalogo.lstUsuario" 
  ng-model="solicitud.selectedUsuario"></select>  								        
								        </div>
									</div>
									<div class="form-group">
										<label id="spanRegion" for="ddmRegion"
											class="col-lg-2 control-label">A.5.Region:</label>
										<div class="col-lg-10">
									      <select id="ddmRegion" 
									class="form-control btn-default  dropdown-toggle" 
  ng-options="region.tag for region in catalogo.lstRegion " 
  ng-model="solicitud.selectedRegion"></select>  
										</div>
									</div>
									<div class="form-group">
										<label id="spanFuncion" for="ddmFuncion"
											class="col-lg-2 control-label">A.6.Funcion:</label>
										<div class="col-lg-10">
									      <select id="ddmFuncion" 
									class="form-control btn-default  dropdown-toggle" 
  ng-options="funcion.tag for funcion in catalogo.lstFuncion " 
  ng-model="solicitud.selectedFuncion"></select>										
										</div>
									</div>
									<div class="form-group">
										<label id="spanAccion" for="ddmAccion"
											class="col-lg-2 control-label">A.7.Accion:</label>
										<div class="col-lg-10">
									      <select id="ddmAccion" 
									class="form-control btn-default  dropdown-toggle" 
  ng-options="accion.tag for accion in catalogo.lstAccion" 
  ng-model="solicitud.selectedAccion"></select>										
										</div>									
									   </div>
									</div>
									<div class="form-group">
										<div class="col-lg-10 col-lg-offset-2">
											<nav class="navbar navbar-inverse">
											<div class="container-fluid">
												<div class="navbar-header">
													<button type="button" class="navbar-toggle collapsed"
														data-toggle="collapse"
														data-target="#bs-example-navbar-collapse-2">
														<span class="sr-only">Toggle navigation</span> <span
															class="icon-bar"></span> <span class="icon-bar"></span> <span
															class="icon-bar"></span>
													</button>
												</div>
												<div class="collapse navbar-collapse"
													id="bs-example-navbar-collapse-2">
													<ul class="nav navbar-nav">
													
													
														<li class="active"><a id="btnCargar"
															data-placement="bottom" data-toggle="tooltip"
															data-original-title="Analisis de formulas contables del tramite."
															ng-click="showListaResultado()" href="">B.1.Analizar<span
																class="sr-only">(current)</span></a></li>

														<li><a href="" id="btnReset" data-placement="bottom"
															data-toggle="tooltip"
															data-original-title="Borrar contenido del Formulario."
															ng-click="reset()" ng-disabled="frmSeleccion.$invalid">B.3.Reset</a>

														</li>


													</ul>
													<ul class="nav navbar-nav">

													</ul>

												</div>
											</div>
											</nav>
											<!--
  <alert class="alert alert-danger" role="alert" ng-repeat="alert in alerts" type="{{alert.type}}" close="closeAlert($index)">{{alert.msg}}</alert>
-->
										</div>
									</div>
								</div>
							</div>
						</form>
					</td>
				</tr>
				<tr>
					<td colspan="1">
						<div class="panel panel-info">
							<div class="panel-heading">1.2. Maquina analitica</div>
							<div class="panel-body">

								<div class="col-sm-2">


									<div class="list-group">
										<a href="" class="list-group-item"> 
										<h7 class="list-group-item-heading">1.2.1.Ciclo de ejecucion</h7>
										</a>
									</div>

									<div id="myTabContent" class="tab-content">

										<div class="list-group">
											<a href="" id="toggleAL"
												ng-click="selectedAnalizadorLexico()"
												class="list-group-item"> <h8
													class="list-group-item-heading">A.1.Analizador Lexico</h8>
												<p class="list-group-item-text">(DESCRIPCION)</p>
											</a> <a href="" id="toggleASI"
												ng-click="selectedAnalizadorSintactico()"
												class="list-group-item"> <h8
													class="list-group-item-heading">A.2.Analizador
												Sintactico</h8>
												<p class="list-group-item-text">(DESCRIPCION)</p>
											</a> <a href="" id="toggleASE"
												ng-click="selectedAnalizadorSemantico()"
												class="list-group-item"> <h8
													class="list-group-item-heading">A.3.Analizador
												Semantico</h8>
												<p class="list-group-item-text">(DESCRIPCION)</p>
											</a>
										</div>
									</div>

								</div>


								<div class="col-sm-8">


									<nav class="navbar navbar-inverse">
									<div class="container-fluid">
										<div class="navbar-header">
											<button type="button" class="navbar-toggle collapsed"
												data-toggle="collapse"
												data-target="#bs-example-navbar-collapse-3">
												<span class="sr-only">Toggle navigation</span> <span
													class="icon-bar"></span> <span class="icon-bar"></span> <span
													class="icon-bar"></span>
											</button>


										</div>

										<div class="collapse navbar-collapse"
											id="bs-example-navbar-collapse-3">



											<ul class="nav navbar-nav">

												<li class="active"><a id="btnEjecutar"
													data-placement="bottom" data-toggle="tooltip"
													data-original-title="Ejecutar Formulas del panel" href=""
													ng-click="doEjecutar()">B.1.Ejecutar<span
														class="sr-only">(current)</span></a></li>

											</ul>
											<!-- 
											<ul class="nav navbar-nav">
												<li class="dropdown"><a href="" class="dropdown-toggle"
													data-toggle="dropdown" role="button" aria-expanded="false">B.3.Operacion<span
														class="caret"></span></a>
													<ul class="dropdown-menu" role="menu">
														<li><a href="" ng-click="showListaResultado()">B.2.1.Listado
																de Resultados</a></li>
														<li><a href="" ng-click="showListaError()">B.2.2.Listado
																de Errores</a></li>
													</ul></li>

											</ul>
											 -->
											<ul class="nav navbar-nav navbar-right">

												<li><a id="infoMsgResultado" href="" >{{msgResultado}}</a></li>

											</ul>
										</div>
									</div>
									</nav>

<div id="divMsgError" class="alert alert-danger">
  <strong>{{msgError.codigo}}</strong> {{msgError.mensaje}}
</div>


    <textarea id="source" ></textarea>




									<div class="modal fade" id="myModalListaResultados"
										tabindex="-1" role="dialog"
										aria-labelledby="myModalLabelListaResultados"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">X</button>
													<h4 class="modal-title" id="myModalLabelListaResultados">
														Lista de solicitud</h4>
												</div>
												<div class="modal-body" id="myModalBodyListaResultados">

													<div class="panel panel-info">
														<div class="panel-heading">1.3.Seleccion de parametros</div>
														<div class="panel-body">

															<div class="table-responsive">
																<table id="myTable"
																	class="table table-striped table-hover">
																	<thead>
																		<tr>
																		    <th>MessageUUID</th>
																			<th>Proceso</th>
																			<th>Operacion</th>
																			<th>Usuario</th>
																			<th>Region</th>
																			<th>Funcion</th>
																			<th>Accion</th>
																		</tr>
																	</thead>
																	<tbody>
																		<!-- Add dnamically generated table rows here -->
																	</tbody>
																</table>
															</div>
															<br/>

											<div class="panel panel-default">
	<div class="panel-heading">Solicitud en formato JSON</div>
											
  <div class="panel-body">
															<p>{{jsonSolicitud}}}}
															</p>
															</div>
														
														</div>
														<div class="panel-footer">Resultado de las variables
															declaradas</div>

													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary"
														data-dismiss="modal">Cerrar</button>
													<button type="button" data-placement="bottom" class="btn btn-success"
														data-dismiss="modal" ng-click="cargarSolicitud()" >Cargar</button>

																
												</div>
											</div>
										</div>
									</div>

									<div class="modal fade" id="myModalListaCodigoError"
										tabindex="-1" role="dialog"
										aria-labelledby="myModalLabelListaCodigoError"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">X</button>
													<h4 class="modal-title" id="myModalLabelListaCodigoError">
														Lista de Codigo Error</h4>
												</div>
												<div class="modal-body" id="myModalBodyListaCodigoError">

													<div class="panel panel-danger">
														<div class="panel-heading">1.4.Codigo de Errores</div>
														<div class="panel-body">


															<div class="table-responsive">

																<table id="myTableError"
																	class="table table-striped table-hover">
																	<thead>
																		<tr>
																			<th>Linea</th>
																			<th>Id</th>
																			<th>Codigo</th>
																			<th>Descripcion</th>
																		</tr>
																	</thead>
																	<tbody>
																	</tbody>
																</table>

																<table id="table-javascript"></table>




															</div>
														</div>
														<div class="panel-footer">Lista de CÃ³digo de Errores</div>

													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary"
														data-dismiss="modal">Cerrar</button>

												</div>
											</div>
										</div>
									</div>


									<div class="modal fade" id="myModalGramatica" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabelGramatica"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">X</button>
													<h4 class="modal-title" id="myModalLabelGramatica">
														GrÃ¡matica</h4>
												</div>
												<div class="modal-body" id="myModalBodyGramatica">
													<div class="panel panel-danger">
														<div class="panel-heading">1.5.Gramatica</div>
														<div class="panel-body">


															<div class="form-group">
																<label id="spanFormulario" for="ddmFormulario"
																	class="col-lg-2 control-label">A) Formula:</label>
																<div class="col-lg-10">
																	<select id="ddmFormulario"
																		class="form-control btn-default  dropdown-toggle"
																		ng-options="iFormulario.tag for iFormulario in itemFormulario "
																		ng-model="selectedFormulario"
																		ng-change="updateFormulario()"></select>
																</div>
															</div>

															<div class="form-group">
																<label id="spanFormulario1" for="ddmFormulario1"
																	class="col-lg-2 control-label">B) DescripciÃ³n
																	de la FÃ³rmula</label>
																<div class="col-lg-10">

																	<div id="containerformulas"
																		style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>


																</div>
															</div>




														</div>
														<div class="panel-footer">Lista de Formulas</div>

													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary"
														data-dismiss="modal">Cerrar</button>

												</div>
											</div>
										</div>
									</div>

								</div>
							
							</div>
								<div class="col-sm-2">

									<div class="list-group">
										<a href="#" class="list-group-item"> <h7
												class="list-group-item-heading">1.2.3.Resultados</h7>
											<p class="list-group-item-text">{{resultOpcionSelected}}</p>
										</a>
									</div>

									<div class="table-responsive">
										<table id="testtable" class="table table-hover">
											<thead>
												<tr>
													<th data-field="Linea" data-sortable="true">Linea</th>
													<th data-field="Resultado" data-sortable="true">Resultado</th>
												</tr>
											</thead>
																					<tbody>
																		<!-- Add dnamically generated table rows here -->
																	</tbody>
																	
										</table>
									</div>

									<div class="modal fade" id="myModal" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">Ã</button>
													<h4 class="modal-title" id="myModalLabel"></h4>
												</div>
												<div class="modal-body" id="myModalBody"></div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary"
														data-dismiss="modal">Cerrar</button>

												</div>
											</div>
										</div>
									</div>

									<div class="modal fade" id="myModalLoader" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabelLoader"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">Ã</button>
													<h4 class="modal-title" id="myModalLabelLoader">
														CARGANDO</h4>
												</div>
												<div class="modal-body" id="myModalBodyLoader">POR
													FAVOR ESPERE</div>

											</div>
										</div>
									</div>

								</div>
						</div>


					</td>

				</tr>


			</table>
		</div>
		<div id="messages"></div>
		<div class="panel-footer">SmartFx -
			Proyecto de pruebas unitarias de maquina financiera</div>


		<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">

					<h5>Enlaces</h5>
					<ul>
						<li><a href="http://www.enterprise.com.mx/"
							target="_blank">Terminos y condiciones</a></li>
					    <li><a href="http://www.enterprise.com.mx/"
							target="_blank">Aviso de privacidad</a></li>
						<li><a href="http://www.gob.mx/condusef"
							target="_blank">Condusef</a></li>
					</ul>
				</div>
				<div class="col-sm-4">
					<h5>¿Que es el motor financiero?</h5>
					<p>Test</p>
				</div>
				<div class="col-sm-4">
					<h5>Contacto</h5>

					<p>sistemas@enterprise.com.mx</a>
					</p>
					<p>La informacion publicada en este portal no crea derechos ni
						establece obligaciones distintos de los contenidos en las
						disposiciones fiscales vigentes,</p>
					<p>
						enterprise -  DERECHOS RESERVADOS 2016
					</p>


				</div>
			</div>

		</div>
		
		

		</footer>
</div>
		<script type="text/javascript" src="/libs/jquery/dist/jquery.min.js"></script>
		<script src="/libs/esprima/esprima.js" type="text/javascript"></script>

		<script type="text/javascript"
			src="/libs/bootstrap/dist/js/bootstrap.js"></script>

		<script type="text/javascript" src="/libs/toastr/toastr.js"></script>


		<script type="text/javascript" src="/libs/angular/angular.min.js"></script>
		<script type="text/javascript" src="/libs/angular-animate/angular-animate.js"></script>
		<script type="text/javascript" src="/libs/angular-cookies/angular-cookies.js"></script>
		<script type="text/javascript" src="/libs/angular-resource/angular-resource.js"></script>
		<script type="text/javascript" src="/libs/angular-route/angular-route.js"></script>
		<script type="text/javascript" src="/libs/angular-sanitize/angular-sanitize.js"></script>
		<script type="text/javascript" src="/libs/angular-touch/angular-touch.js"></script>
		<script type="text/javascript" src="/libs/webix/codebase/webix.js"></script>
		<script type="text/javascript" src="/libs/accounting/accounting.js"></script>	
		<script type="text/javascript" src="/libs/codemirror/lib/codemirror.js"></script>
        <script type="text/javascript" src="/libs/codemirror/mode/javascript/javascript.js"></script>
        
		<script type="text/javascript" src="/app/app.js"></script>
  		<script type="text/javascript" src="/app/service/evaluationService.js"></script>

		<script type="text/javascript" src="/app/controller/evaluationController.js"></script>
  
 <script>
      var jsEditor;


      function setupEditor() {
        jsEditor = CodeMirror.fromTextArea($('#source').get(0), {
          mode: "javascript",
          gutter: true,
          lineNumbers: true
        })

       //jsEditor.on("keyHandled", updateJsonViewer);
        jsEditor.setSize('100%', '400');
        
        jsEditor.gutter = true;
      }

      $(function() {
        setupEditor();

      });
      
      toastr.options = {
    		  "closeButton": true,
    		  "debug": false,
    		  "newestOnTop": true,
    		  "progressBar": true,
    		  "positionClass": "toast-top-right",
    		  "preventDuplicates": false,
    		  "onclick": null,
    		  "showDuration": "300",
    		  "hideDuration": "1000",
    		  "timeOut": "5000",
    		  "extendedTimeOut": "1000",
    		  "showEasing": "swing",
    		  "hideEasing": "linear",
    		  "showMethod": "fadeIn",
    		  "hideMethod": "fadeOut"
    		};
      
    </script>
</body>
</html>