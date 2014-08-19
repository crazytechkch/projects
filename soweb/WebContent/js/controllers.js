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
			$scope.showmenu = !($scope.showmenu);
		};
		$scope.closeMenu = function() {$scope.showmenu = false};
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
		$scope.gender = 'male';
		$scope.positions = ['Analyst','Executive','Secretary','Programmer'];
		$scope.post = '';
		$scope.selectedPer = {};
		$scope.commitPersonnel = function(){
			 var fname = document.getElementById("in_fname").value;
			 var lname = document.getElementById("in_lname").value;
			 var phone1 = document.getElementById("in_phone1").value;
			 var phone2 = document.getElementById("in_phone2").value;
			 var email = document.getElementById("in_email").value;
			 var per = $scope.selectedPer;
			 console.log($scope.gender);
			 if(per.index==null)$scope.pers.push({"firstname":fname,"lastname":lname,"position":$scope.post,"contact1":phone1,"contact2":phone2,"email":email,"gender":$scope.gender});
			 else $scope.pers[per.index]={"id":per.id,"firstname":fname,"lastname":lname,"position":$scope.post,"contact1":phone1,"contact2":phone2,"email":email,"gender":$scope.gender,"img":per.img};
			 $scope.modalShown = !$scope.modalShown;
		}
		$scope.uploadProfilePic = function () {
			document.getElementById("in_img_file").click();
		}
		$scope.changeGender = function (gender){
			$scope.gender = gender;
			if($scope.selectedPer.img==null||$scope.selectedPer.img=='')$scope.selectedPer.tempImg = './res/img/personnel/profpic_'+gender;
		}
		$scope.showDelBox = function(index){
			 if (confirm("Confirm Delete?") == true) {
		        $scope.pers.splice(index,1);
		    } else {
		        // do not delete
		    }
		}
		$scope.modalShown = false;
		$scope.changePosition = function(position) {
			$scope.post = position;
		}
		$scope.showModal = function (index, isEdit) {
			$scope.selectedPer={};
			if (isEdit){
				var per = $scope.pers[index];
				per.index = index;
				if(per.img==''||per.img==null)per.tempImg='./res/img/personnel/profpic_'+per.gender;
				else per.tempImg = './res/img/personnel/'+per.img;
				console.log(per);
				$scope.gender=per.gender;
				$scope.post=per.position;
				for(var i = 0;$scope.positions.length;i++){
					if($scope.positions[i]==per.position){
						document.getElementById("selectPost").selectedIndex = i;
						break;
					}
				}
				$scope.selectedPer = per;
				assignInput(per);
			}
			else {
				assignInput({});
				$scope.gender='male';
				$scope.post='Analyst';
				$scope.selectedPer.tempImg = './res/img/personnel/profpic_male';
			}
			$scope.modalShown = !$scope.modalShown;
		}
		$scope.closeModal = function(){
			$scope.modalShown = false;
		}
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



function assignInput(per) {
	document.getElementById("in_fname").value = checkUndefined(per.firstname);
	document.getElementById("in_lname").value = checkUndefined(per.lastname);
	document.getElementById("in_phone1").value = checkUndefined(per.contact1);
	document.getElementById("in_phone2").value = checkUndefined(per.contact2);
	document.getElementById("in_email").value = checkUndefined(per.email);
}

function checkUndefined (value) {
	if (value==null) return '';
	return value;
}