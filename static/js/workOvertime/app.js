require.config({
	baseUrl: '/js'
});

require(['lib/validator', 'lib/bootstrap', 'workOvertime/service',  'workOvertime/usersCtrl',  'workOvertime/controller', 'workOvertime/filter',
	'workOvertime/editCtrl', 'workOvertime/directive'], function() {
	validator.bind();
	angular.module('myApp', ['moduleListCtrl', 'moduleDetailCtrl', 'moduleSvc', 'moduleFilter', 'moduleDirect']);
	angular.element(document).ready(function() {
		angular.bootstrap(document, ['myApp']);
		$('#datetimepicker').val(moment().format("YYYY-MM-DD HH:mm"));
		$('#searchInput').val(query_list.month);

		$('#searchInput').datetimepicker({
			format:"yyyy-mm",
			autoclose: true,
			language:  'zh-CN',
			startView: "year",
			minView: "year",
			minuteStep : 1,
			endDate : new Date()
		});

		$('#datetimepicker').datetimepicker({
			autoclose: true,
			language:  'zh-CN',
			minView: "day",
			minuteStep : 1,
			endDate : new Date()
		});

	});
});
