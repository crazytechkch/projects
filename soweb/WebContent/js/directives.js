'use strict';

/* Directives */


angular.module('myApp.directives', []).
  directive('appVersion', ['version', function(version) {
    return function(scope, elm, attrs) {
      elm.text(version);
    };
  }])
  .directive('sliderDirv',['$swipe',
      function($swipe) {
		  return {
			  restrict: 'EA',
			  link: function(scope, ele, attrs, ctrl) {
				  var startX, pointX;
				  $swipe.bind(ele, {
					  'start': function(coords) {
						  startX = coords.x;
						  pointX = coords.y;
					  },
					  'move': function(coords) {
						  var delta = coords.x - pointX;
						  // ...
					  },
					  'end': function(coords) {
						  // ...
					  },
					  'cancel': function(coords) {
						  // ...
					  }
				  });
			  }
		  }
	  }
  ])
  .directive('modalDialog',function() {
	  return {
		  restrict: 'E',
		  scope: {
			  show: '='
		  },
		  replace: true, // Replace with the template below
		  transclude: true, // we want to insert custom content inside the directive
		  link: function(scope, element, attrs) {
			  scope.dialogStyle = {};
			  if (attrs.width)
				  scope.dialogStyle.width = attrs.width;
			  if (attrs.height)
				  scope.dialogStyle.height = attrs.height;
			  console.log('width : '+attrs.width);
			  console.log('height : '+attrs.height);
			  scope.hideModal = function() {
				  scope.show = false;
			  };
		  },
		  template: "<div class='ng-modal' ng-show='show'>"+
				  "<div class='ng-modal-overlay' ng-click='hideModal()'></div>"+
				  "<div class='ng-modal-dialog' ng-style='dialogStyle'>"+
				  "<div class='ng-modal-close' ng-click='hideModal()'>X</div>"+
				  "<div class='ng-modal-dialog-content' ng-transclude></div>"+
				  "</div></div>"
	};
  });
