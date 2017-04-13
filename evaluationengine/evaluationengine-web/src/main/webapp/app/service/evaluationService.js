'use strict';

var module = angular.module('evaluationEngineApp');
module.factory('evaluationService', function($resource) {

    function subscripcionService() {
    	return $resource('/subs', { format: 'json', jsoncallback: 'JSON_CALLBACK' }, { 'load': { 'method': 'JSONP' } });
    }

    function cargarService(json) {	
    	return $resource('/cargar', { });
    }
    return {
    	subscripcionService: subscripcionService,
    	cargarService: cargarService
    };
});


module.service('GenerarFormulaModel',function(){
	this.catalogo={
			 lstNombreProceso : [],
			 lstNombreOperacion : [],
			 lstUsuario : [],
			 lstRegion : [],
			 lstFuncion : [],
			 lstAccion : []
	};
	this.solicitud={
			selectedNombreProceso : [],
        	selectedNombreOperacion : [],
        	selectedUsuario : [],
        	selectedRegion: [],
        	generatedMessageUUID:'<uuid>',
        	selectedFuncion:[],
        	selectedAccion:[]
	};
	this.msgError = {
			codigo : '', 
			mensaje : ''
	};
	this.exe = {evaluacionSourceCode: ''};
});


module.service('generadorFormulaCatalogo', function(GenerarFormulaModel) {
	this.catalogo = GenerarFormulaModel.catalogo;
	this.solicitud = GenerarFormulaModel.solicitud;
	this.msgError = GenerarFormulaModel.msgError;
	this.exe = GenerarFormulaModel.exe;

	this.catalogo.lstNombreProceso.push( {
        'id' : 0, 'tag' : 'SystemFinancial'},{
        'id' : 1, 'tag' : 'EnterpriseRet'
    });
	
	this.catalogo.lstNombreOperacion.push( {
        'id' : 0, 'tag' : 'Cuota Mesa'},{
        'id' : 1, 'tag' : 'Cuota General'
    });
	
	this.catalogo.lstUsuario.push( {
        'id' : 0, 'tag' : 'USR-001'},
        {'id' : 1, 'tag' : 'USR-002'},
        {'id' : 2, 'tag' : 'USR-003'}
        );
	this.catalogo.lstRegion.push( {
        'id' : 0, 'tag' : 'Metropolitana'},
        {'id' : 1, 'tag' : 'Guadalajara'},
        {'id' : 2, 'tag' : 'Monterrey'},
        {'id' : 3, 'tag' : 'Tijuana'}
        );
	this.catalogo.lstFuncion.push( {
        'id' : 0, 'tag' : 'Cuota'},
        {'id' : 1, 'tag' : 'Impuesto'},
        {'id' : 2, 'tag' : 'Renovacion'}
        );
	this.catalogo.lstAccion.push( {
        'id' : 0, 'tag' : 'Restitucion'},
        {'id' : 1, 'tag' : 'Tarifa'}
        );
  	
	this.lstcatalogo  = [{id:'lstNombreProceso',arr:this.catalogo.lstNombreProceso},
					  {id:'lstNombreOperacion',arr:this.catalogo.lstNombreOperacion},
					  {id:'lstUsuario',arr:this.catalogo.lstUsuario},
					  {id:'lstRegion',arr:this.catalogo.lstRegion},
					  {id:'lstFuncion',arr:this.catalogo.lstFuncion},
					  {id:'lstAccion',arr:this.catalogo.lstAccion}];
	
    this.buscar = function(id){
    	var arrret= ($.grep(this.lstcatalogo, function(obj) {return obj.id === id;}));
    	if(arrret.length>0){
    		return arrret[0].arr;
    	}else {
    		return [];
    	}
    };
    
	this.limpiar = function(){
		this.solicitud.selectedNombreProceso = this.catalogo.lstNombreProceso[0];
		this.solicitud.selectedNombreOperacion = this.catalogo.lstNombreOperacion[0];
		this.solicitud.selectedUsuario = this.catalogo.lstUsuario[0];
		this.solicitud.selectedRegion=this.catalogo.lstRegion[0];
		this.solicitud.generatedMessageUUID='<uuid>';
		this.solicitud.selectedFuncion=this.catalogo.lstFuncion[0];
		this.solicitud.selectedAccion=this.catalogo.lstAccion[0];
	};
	
});

