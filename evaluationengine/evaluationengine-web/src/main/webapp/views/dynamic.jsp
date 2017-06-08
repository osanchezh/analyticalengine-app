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
<link type="text/css" rel="stylesheet"
	href="/libs/bootstrap/dist/css/paper.css" />
<link type="text/css" rel="stylesheet" href="/libs/toastr/toastr.css" />
<!-- CODE Mirror -->
<link href="/libs/codemirror/lib/codemirror.css" rel="stylesheet"
	type="text/css">



</head>
<body ng-app="evaluationEngineApp" ng-controller="DynamicFormController">

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
				<a class="navbar-brand" href="http://www.enterprise.com"> enterprise </a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">Motor de evaluacion</a></li>

				</ul>
				
				<ul class="nav navbar-nav navbar-right">
											<li class="active">
											   <a href="">
											      Usuario:<b>STOCKER-JULIO</b>
											   </a>
											 </li>
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
											<button type="submit" class="btn btn-success btn-block">Maquina financiera</button>
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


			<form name="myForm" class="form-horizontal" role="form">
				<fieldset>
					<h3 class="subheader">
						1.<strong>Formulario</strong> asincrono
					</h3>
				</fieldset>

				<div class="panel panel-info">
					<div class="panel-heading">1.1. Calculo de cuota</div>
					<div class="panel-body">
						<div class="col-sm-8">
<div class="panel panel-default">
  <div class="panel-heading">Identificacion de aplicacion</div>
  <div class="panel-body">

    <label for="lblAppName">Aplicacion:</label>
									<span id="lblAppName">
										<b>{{entity.applicationName}}</b>											
      </span>
<label for="lblTimeToLive">, Tiempo limite:</label> <span id="lblTimeToLive"><b>{{counter}} segundos de {{entity.configuration.timetolive}} segundos de servicio</b></span>
											
<label for="lblVersion">, Version:</label> <span id="lblTimeToLive"><b>{{entity.configuration.version}}</b></span></a>

    
  </div>
</div>

<div id="pnlOperacion" class="panel panel-primary">
  <div class="panel-heading">Operacion a ejecutar</div>
  <div class="panel-body">



							<div ng-repeat="field in entity.fields">
								<ng-form name="form"> <!-- TEXT FIELDS -->

								<div ng-if="field.type=='text'" class="form-group">
									<label class="col-sm-2 control-label">{{field.label}}</label>
									<div class="col-sm-6">
										<input type="{{ field.type }}" dynamic-name="field.name"
											id="{{field.name}}" data-ng-model="field.data"
											class="form-control" required />
										<!--<span ng-show="myForm.{{field.name}}.$dirty && myForm.{{field.name}}.$error.required">Required!</span>.-->
										<span
											data-ng-show=" {{'form.'+field.name+'.$dirty && form.'+field.name+'.$error.required'}}">Required!</span>
									</div>
								</div>

								<!-- EMAIL FIELDS -->

								<div ng-if="field.type=='email'" class="form-group">
									<label class="col-sm-2 control-label">{{field.label}}</label>
									<div class="col-sm-6">
										<input type="{{ field.type }}" dynamic-name="field.name"
											data-ng-model="field.data" class="form-control" required /> <span
											data-ng-show=" {{'form.'+field.name+'.$dirty && form.'+field.name+'.$error.required'}}">Required!</span>
										<span
											data-ng-show=" {{'form.'+field.name+'.$dirty && form.'+field.name+'.$error.email'}}">Not
											email!</span>
									</div>
								</div>

								<!-- PASSWORD FIELDS -->

								<div ng-if="field.type=='password'" class="form-group">
									<label class="col-sm-2 control-label">{{field.label}}</label>
									<div class="col-sm-6">
										<input type="{{ field.type }}" dynamic-name="field.name"
											data-ng-model="field.data" ng-minlength={{field.min}}
											ng-maxlength={{field.max}} class="form-control" required /> <span
											data-ng-show=" {{'form.'+field.name+'.$dirty && form.'+field.name+'.$error.required'}}">Required!</span>
										<span
											data-ng-show=" {{'!form.'+field.name+'.required && (form.'+field.name+'.$error.minlength || form.'+field.name+'.$error.maxlength)' }}">Passwords
											must be between 8 and 20 characters.</span>
									</div>
								</div>

								<!-- SELECT FIELDS -->

								<div ng-if="field.type=='select'" class="form-group">
									<label class="col-sm-2 control-label">{{field.label}}</label>
									<div class="col-sm-6">
										<select data-ng-model="field.data"
											ng-options="option.name for option in field.options"
											class="form-control" required />
									</div>
								</div>

								<!-- RADIO FIELDS -->

								<div ng-if="field.type=='radio'" class="form-group">
									<label class="col-sm-2 control-label">{{field.label}}</label>
									<div class="col-sm-6">

										<div class="checkbox" ng-repeat="option in field.options">

											<input type="radio" data-ng-model="field.data"
												name="taskGroup" id="{{option.name}}" value="{{option.id}}">{{option.name}}

										</div>
									</div>
								</div>


								<!-- CHECKBOX FIELDS -->
								<div ng-if="field.type=='checkbox'" class="form-group">
									<label class="col-sm-2 control-label">{{field.label}}</label>
									<div class="col-sm-6">
										<div class="checkbox" ng-repeat="option in field.options">
											<label> <input type="checkbox"
												data-ng-model="option.data" name="taskGroup"
												id="{{option.name}}" value="{{option.id}}">{{option.name}}
											</label>
										</div>

									</div>

								</div>

                            <div class="form-group">

								<label class="col-sm-2 control-label" for="lblTimeToLive">Total:</label>

								<div class="col-sm-6">
									<p id="lblTotal"  class="form-control-static mb-0">
										<b>{{varTotal}}</b>
									</p>
								</div>

							</div>
							
							
                            <div class="form-group">

								<label class="col-sm-2 control-label" for="lblTimeToLive">Impuesto:</label>

								<div class="col-sm-6">
									<p id="lblImpuesto"  class="form-control-static mb-0">
										<b>{{varImpuesto}}</b>
									</p>
								</div>

							</div>


                            <div class="form-group">

								<label class="col-sm-2 control-label" for="lblTimeToLive">TotalApagar:</label>

								<div class="col-sm-6">
									<p id="lblTotalApagar"  class="form-control-static mb-0">
										<b>{{varTotalApagar}}</b>
									</p>
								</div>

							</div>
							
					<div class="form-group">		
<label class="col-sm-2 "></label>
 <div class="col-sm-8">
 <button type="button" id="btnCalcular" ng-click="submitForm()" class="btn btn-success"  aria-haspopup="true" aria-expanded="false">
      B.1.Calcular
  </button>
  
 <button type="button" id="btnFirmar" ng-click="firmarClick()" class="btn btn-success"  aria-haspopup="true" aria-expanded="false">
      B.2.Firmar
  </button>
<div id="divMsgError" class="alert alert-danger">
  <strong>{{msgError.codigo}}</strong> {{msgError.mensaje}}
</div>

  </div>
</div>

  </div>
  </div>
  
  <div class="panel panel-default">
  <div class="panel-heading">Identificador de operacion</div>
  <div class="panel-body">
       <label id="spanTipoTramite">Message UUID: <b>{{solicitud.generatedMessageUUID}}</b></label>
		<label id="spanNombreProceso">, Nombre de proceso: <b>App</b></label>								
        <label id="spanNombreOperacion">, Nombre de operacion: <b>Couta Mesa</b></label>										
		<label id="spanUsuario">, Usuario: <b>STOCKER-JULIO</b></label>
		<label id="spanRegion">, Region: <b>Metropolitana</b></label>
		<label id="spanFuncion">, Funcion: <b>Cuota</b></label>
		<label id="spanFuncion">, Accion: <b>Impuesto</b></label>
  </div>
</div>




  
    <div class="panel panel-default">
  <div class="panel-heading">Formula matematica</div>
  <div class="panel-body">
            <textarea class="form-control" rows="12" id="txtaFormula">{{scriptFormula}}</textarea>
  
  </div>


  </div>
  
								</ng-form>


  
  
  							
								
							</div>

							<pre><small>{{entity|json}}</small></pre>

						</div>






					</div>
				</div>

			</form>




		</div>

		<div id="messages"></div>
		<div class="panel-footer">App - Proyecto de pruebas
			unitarias de maquina financiera</div>


		<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-4">

					<h5>Enlaces</h5>
					<ul>
						<li><a
							href="http://www.enterprise.com.mx/portal/"
							target="_blank">Terminos y condiciones</a></li>
						<li><a
							href="http://www.enterprise.com.mx/portal/"
							target="_blank">Aviso de privacidad</a></li>
						<li><a href="http://www.gob.mx/condusef" target="_blank">Condusef</a></li>
					</ul>
				</div>
				<div class="col-sm-4">
					<h5>¿Que es el motor financiero?</h5>
					<p>Test</p>
				</div>
				<div class="col-sm-4">
					<h5>Contacto</h5>

					<p>
						sistemas@enterprise.com.mx</a>
					</p>
					<p>La informacion publicada en este portal no crea derechos ni
						establece obligaciones distintos de los contenidos en las
						disposiciones fiscales vigentes,</p>
					<p>ENTERPRISE - DERECHOS RESERVADOS 2016</p>


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
	<script type="text/javascript"
		src="/libs/angular-animate/angular-animate.js"></script>
	<script type="text/javascript"
		src="/libs/angular-cookies/angular-cookies.js"></script>
	<script type="text/javascript"
		src="/libs/angular-resource/angular-resource.js"></script>
	<script type="text/javascript"
		src="/libs/angular-route/angular-route.js"></script>
	<script type="text/javascript"
		src="/libs/angular-sanitize/angular-sanitize.js"></script>
	<script type="text/javascript"
		src="/libs/angular-touch/angular-touch.js"></script>
	<script type="text/javascript" src="/libs/webix/codebase/webix.js"></script>
	<script type="text/javascript" src="/libs/accounting/accounting.js"></script>
	<script type="text/javascript" src="/libs/codemirror/lib/codemirror.js"></script>
	<script type="text/javascript"
		src="/libs/codemirror/mode/javascript/javascript.js"></script>

	<script type="text/javascript" src="/app/app.js"></script>
	<script type="text/javascript" src="/app/controller/dynamicController.js"></script>
    <script type="text/javascript" src="/app/service/evaluationService.js"></script>

	<script>
		toastr.options = {
			"closeButton" : true,
			"debug" : false,
			"newestOnTop" : true,
			"progressBar" : true,
			"positionClass" : "toast-top-right",
			"preventDuplicates" : false,
			"onclick" : null,
			"showDuration" : "300",
			"hideDuration" : "1000",
			"timeOut" : "5000",
			"extendedTimeOut" : "1000",
			"showEasing" : "swing",
			"hideEasing" : "linear",
			"showMethod" : "fadeIn",
			"hideMethod" : "fadeOut"
		};
	</script>
</body>
</html>