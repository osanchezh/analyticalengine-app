'use strict';
var app = angular.module('evaluationEngineApp');
app.constant("url_subscription" , "/subs");
app.constant("url_ejecutar" , "/ejecutar");
app.config(function($provide) {
    $provide.decorator("$log", function ($delegate,$filter) {
        $delegate.originalLog = $delegate.log;
     
        $delegate.log = function (message) {
        	var currentDate = $filter('date')(new Date(),'yyyy-MM-dd HH:mm:ss Z');
            $delegate.originalLog("log -  " + currentDate + " - "+  message);
        }
        $delegate.debug = function (message) {
        	var currentDate = $filter('date')(new Date(),'yyyy-MM-dd HH:mm:ss Z');
            $delegate.originalLog("debug -  " + currentDate + " - "+ message);
        }
        
        return $delegate;
    });
});
app.config(function($logProvider){
	  $logProvider.debugEnabled(true);
	});

app.controller('DynamicFormController', function ($scope, $log,$timeout,$http,
		url_subscription,
		url_ejecutar,
		generadorFormulaCatalogo) {
	
    $scope.msgError=generadorFormulaCatalogo.msgError;
    $scope.exe=generadorFormulaCatalogo.exe;
    $scope.solicitud=generadorFormulaCatalogo.solicitud;
		
   	$scope.init = function(){
   		$scope.reset();
        $("#divMsgError").hide();
        $("#btnFirmar").prop("disabled", true);
        $log.debug("inicio:");

	};
	
    $scope.reset = function () {
    	 $http.get(url_subscription).
    	 success(function(data, status, headers, config) {
            $scope.solicitud.generatedMessageUUID=data.messageUUID;
        });
    };
    
    $scope.entity = {
      applicationName : "CuotaMesaApp", 
      fields :
        [
          {type: "text", name: "txtIndicador", label: "Indicador:" , required: true, data:"1", variable:"txtIndicador"},
          {type: "text", name: "txtPresupuesto", label: "Presupuesto:" , required: true, data:"1",  variable:"txtPresupuesto"},
          {type: "text", name: "txtActualizacion", label: "Actualizacion:" , required: true, data:"1" ,  variable:"txtActualizacion"},
          {type: "text", name: "txtRecargo", label: "Recargo:" , required: true, data:"1" ,  variable:"txtRecargo"},
          {type: "text", name: "txtReduccion", label: "Reduccion:" , required: true, data:"1",  variable:"txtReduccion"}
        ],
       configuration : 
    	  {id: "X10002", timetolive: 5, version : "1.1.3" },
       execution: "impuesto,total,totalApagar"
       
      };
      $scope.firmar = function(){
    	  toastr.success("Firmado correcto");
      };
      $scope.scriptFormula="";
      $scope.varImpuesto = "";
      $scope.varTotal = "";
      $scope.varTotalApagar = "";
      
      $scope.firmarClick = function(){
    	  $scope.counter = 0;
    	  $scope.startCounter();
    	  $("#btnFirmar").prop("disabled", true);
	      $("#btnCalcular").prop("disabled", false);
	      $("#pnlOperacion").addClass('panel-primary');
	      $("#pnlOperacion").removeClass('panel-default');
	      $scope.reset();
      }
      $scope.submitForm = function(){
        $log.debug($scope.entity);
        var scripts1= "";

        angular.forEach($scope.entity.fields, function(scriptx){
        	scripts1 = scripts1 + (scriptx.variable+"="+scriptx.data+"; ") + "\n";
        });
        scripts1 = scripts1 + "total = txtIndicador + txtPresupuesto + ((txtActualizacion/txtRecargo) / 100.0);" + "\n";
        scripts1= scripts1 + "impuesto = IVA(total);"+ "\n";
        scripts1= scripts1 + "totalApagar = impuesto + total;"+ "\n";
        
        
        $scope.exe.evaluacionSourceCode= "def "+$scope.entity.applicationName+"() { \n"+scripts1+"return ["+$scope.entity.execution+"]; \n}; "+$scope.entity.applicationName+"();";
        $scope.scriptFormula=$scope.exe.evaluacionSourceCode;
        toastr.info("Formula analizada ");
        $scope.jsonEjecutar = JSON.stringify($scope.exe);

   	 $http.post(url_ejecutar,$scope.jsonEjecutar).
	 success(function(data, status, headers, config) {
		 if(data.error){
			 //alert("error="+data.msgError);
			 $scope.msgError.codigo="Error:";
			 $scope.msgError.mensaje = data.msgError;
			 $("#divMsgError").show();
			 $scope.msgResultado = 'Ejecucion tiene problemas de sintaxis.'
				 //result.setAttribute('class', 'label label-danger');
 		        toastr.error("Calculo incorrecto");
		 }else{
		        toastr.success("Calculo correcto");
    		    var sformulas = "";
    		    
    		      $scope.varImpuesto = data.lst[0].valor;
    		      $scope.varTotal = data.lst[1].valor;
    		      $scope.varTotalApagar = data.lst[2].valor;
    		      
             $scope.msgResultado = 'Ejecucion exitosa.'

    	     $("#divMsgError").hide();
		 }

	      }).
	      error(function(data, status, headers, config) {
	        alert("error");
	      });
      }
      
      var timer;
      $scope.counter = 0;
      $scope.stopCounter = function() {
          $timeout.cancel(timer);
          timer = null;
      };
      $scope.startCounter = function() {
          if (timer === null) {
              updateCounter();
          }
      };
      var updateCounter = function() {
          $scope.counter++;
          timer = $timeout(updateCounter, 1000);
          if($scope.counter>=$scope.entity.configuration.timetolive){
        	  $scope.stopCounter();
		      toastr.error("Tiempo ha expirado.");
		      $("#btnCalcular").prop("disabled", true);
		      $("#btnFirmar").prop("disabled", false);

		      $("#pnlOperacion").removeClass('panel-primary');
		      $("#pnlOperacion").addClass('panel-default');
          }
      };
      updateCounter();
      $scope.init();
})

  .directive("dynamicName",function($compile){
    return {
        restrict:"A",
        terminal:true,
        priority:1000,
        link:function(scope,element,attrs){
            element.attr('name', scope.$eval(attrs.dynamicName));
            element.removeAttr("dynamic-name");
            $compile(element)(scope);
        }
    }
})
