'use strict';

/* Controllers */
var css_item_background = 'linear-gradient(black,#444444,black)';
angular.module('myApp.controllers', [])
	.controller('mainCtrl',['$scope', function($scope){
	}])
	.controller('sliderCtrl', ['$scope', function($scope) {
		var locales=[
		             {'name':'Bahasa Melayu','code':'ms'},
		             {'name':'English','code':'en'},
		             {'name':'中文简体','code':'zh'},
		             ];
		$scope.locales = locales;
		$scope.selectedLocale=locales[1];
		$scope.showmenu=false;
		$scope.toggleMenu=function () {
		$scope.showmenu = ($scope.showmenu)?false:true;  
	  };
	}])
	.controller('persCtrl', function($scope, $http) {
		$http({method: 'GET', url: './testdata.json'}).
		    success(function(data) {
		    	$scope.pers = data;
		    	console.log($scope.pers);
		    	$scope.message = 'success'; 
		    	
		    	return data;
			}).
		    error(function(data) {
			   $scope.message = 'failed';
		    });
	})
	.controller('rptCtrl', function($scope,$http){
		var $tabs = [];
		var repdata;
		$http({method: 'GET', url: './reportdata.json'}).
		    success(function(data) {
		    	repdata = data.data;
		    	for(var i=0; i < repdata.length;i++){
		    		$tabs[i] = repdata[i].header;
		    	}
		    	console.log(repdata);
		    	return data;
			}).
		    error(function(data) {
			  
		    });
		
		$scope.tabs = $tabs;
		var prevType;
		var rptIndex;
		$scope.setType = function(index) {
			document.getElementById('tableContent').innerHTML = ''
			rptIndex = index;
			if (prevType!=null){
				prevType.style.background = '#f1f1f1';
				prevType.style.color = '#424242';
			}
			var repType = $tabs[index];
			$scope.rpttype = repType;
			var div = document.getElementById('rpttab');
			var childs = div.childNodes;
			var button = document.getElementById('rpttype'+index);
			button.style.background = css_item_background;
			button.style.color = '#f1f1f1';
			button.style.borderRadius = '5px';
			prevType = button;
			var tables;
			if (repdata!=null) {
				tables = repdata[index].tables;
				$scope.tables = tables;
			}
		}
		var prevTable;
		$scope.setTable = function(index){
			if (prevTable!=null){
				prevTable.style.background = '#f1f1f1';
				prevTable.style.color = '#424242';
			}
			var div = document.getElementById('tables');
			var childs = div.childNodes;
			var button = document.getElementById('table'+index);
			button.style.background = css_item_background;
			button.style.color = '#f1f1f1';
			button.style.borderRadius = '5px';
			prevTable = button;
			document.getElementById('tableContent').innerHTML = repdata[rptIndex].tables[index].html;
		}
	});

