angular.module('sfdc1.services', [])

.factory('Studies', function($q, $rootScope) {
    
    var studies;
    var questions;
    
    function query(queryContstraints) {
	
		var deferred = $q.defer();
		CW_StudyListController.getStudies(function(result, event){
            studies = result;
            deferred.resolve(studies);
		});
		
		return deferred.promise;
	}
    
    return {
		all: function() {
            return query();
        },
		get: function(studyId) {
			for (var i = 0; i < studies.length; i++) {
				var study = studies[i];
				if (study.Id === studyId) {
					return study;
				}
			}
		},
		getQuestions: function(studyId) {
			var deferred = $q.defer();
			CW_StudyListController.getQuestions(studyId, function(result, event){
	            questions = result;
	            deferred.resolve(questions);
			});

			return deferred.promise;
		}
    }
})