angular.module('sfdc1', ['ionic', 'sfdc1.controllers', 'sfdc1.services'])

.run(function($ionicPlatform) {
	$ionicPlatform.ready(function() {
		if(window.StatusBar) {
			StatusBar.styleDefault();
		}
	});
})

.config(function($stateProvider, $urlRouterProvider) {
	$stateProvider

	.state('tab', {
		url: "/tab",
		abstract: true,
		templateUrl: "apex/CW_StudyTabs"
	})

	.state('tab.studies', {
		url: '/studies',
		views: {
			'tab-studies': {
				templateUrl: 'apex/apex/CW_StudyList',
				controller: 'CW_StudyListCtrl'
			}
		}
	})
    
    .state('tab.studies-detail', {
		url: "/studies/:studyId",
		views: {
			'tab-studies' :{
				templateUrl: "apex/CW_StudyDetail",
				controller: 'CW_StudyListDetailCtrl'
			}
		}
	});
	
    // if none of the above states are matched, use this as the fallback
	$urlRouterProvider.otherwise('/tab/studies');
});