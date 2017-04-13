'use strict';
var module = angular.module('evaluationEngineApp');

module.controller('evaluationEngineController',function($scope, $http,
		evaluationService,generadorFormulaCatalogo){
	
	    $scope.catalogo = generadorFormulaCatalogo.catalogo;
	    $scope.solicitud=generadorFormulaCatalogo.solicitud;
	    $scope.msgError=generadorFormulaCatalogo.msgError;
	    $scope.exe=generadorFormulaCatalogo.exe;

    	$scope.jsonSolicitud='(json)';
    

    	$scope.init = function(){
            $scope.reset();
            $("#divMsgError").hide();
    	};
    	
        $scope.reset = function () {
        	generadorFormulaCatalogo.limpiar();
        	
        	evaluationService.subscripcionService()
            .get(function(response) {
                $scope.solicitud.generatedMessageUUID=response.messageUUID;
            });
        };
        
        $scope.showListaResultado = function () {
        	$scope.jsonSolicitud = JSON.stringify($scope.solicitud);
        	$('#myTable tbody > tr').remove();
        	
                $('#myTable > tbody:last').append("<tr><td name='MessageUUID'>" + 
                		$scope.solicitud.generatedMessageUUID + "</td>" + 
                		"<td name='Proceso'>" + $scope.solicitud.selectedNombreProceso.tag 
                		+ "</td>" + "<td name='Operacion'>" + $scope.solicitud.selectedNombreOperacion.tag
                		+ "</td>" + "<td name='Usuario'>" + $scope.solicitud.selectedUsuario.tag
                		+ "</td>" + "<td name='Region'>" +$scope.solicitud.selectedRegion.tag + "</td>" 
                		+ "</td>" + "<td name='Funcion'>" +$scope.solicitud.selectedFuncion.tag + "</td>" 
                		+ "</td>" + "<td name='Accion'>" +$scope.solicitud.selectedAccion.tag + "</td>" 
                		+ "</tr>");
            
            $('#myModalListaResultados').modal('show');

        };
        
        $scope.cargarSolicitud = function(){
        	$scope.jsonSolicitud = JSON.stringify($scope.solicitud);
        	
        	 $http.post("/cargar",$scope.jsonSolicitud).
        	 success(function(data, status, headers, config) {
        		 
        		      $scope.exe.evaluacionSourceCode=data.codigo;
        	
        	          jsEditor.setValue($scope.exe.evaluacionSourceCode);
        	          
        	      }).
        	      error(function(data, status, headers, config) {
        	        alert("error");
        	      });
        }
        $scope.doEjecutar = function(){
		      $scope.exe.evaluacionSourceCode=jsEditor.getValue();

        	 $scope.jsonEjecutar = JSON.stringify($scope.exe);
            
             //var result = document.getElementById('infoMsgResultado');

             $http.post("/ejecutar",$scope.jsonEjecutar).
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

        	        	$('#testtable tbody > tr').remove();

            		 var sformulas = "";
                     for (var ice = 0;ice < data.lst.length;ice++) {
                         sformulas += data.lst[ice].valor + "\n";

                         $('#testtable > tbody:last').append("<tr>" + 
                         		"<td name='Linea'>" + (ice+1)
                         		+ "</td>" + "<td name='Resultado'>" + data.lst[ice].valor  + "</td>" 
                         		+ "</tr>");
                         
                     }
                     $scope.msgResultado = 'Ejecucion exitosa.'

            	     $("#divMsgError").hide();
        		 }

        	      }).
        	      error(function(data, status, headers, config) {
        	        alert("error");
        	      });
        }
        $scope.init();

});