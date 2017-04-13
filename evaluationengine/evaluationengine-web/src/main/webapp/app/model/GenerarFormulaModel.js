'use strict';
var module = angular.module('evaluationEngineApp');

module.controller('GenerarFormulaModel',function($scope){
	$scope.solicitud={
			selectedNombreProceso : [],
        	selectedNombreOperacion : [],
        	selectedUsuario : [],
        	selectedRegion: [],
        	generatedMessageUUID:'<uuid>',
        	selectedFuncion:[],
        	selectedAccion:[]
	};
});
