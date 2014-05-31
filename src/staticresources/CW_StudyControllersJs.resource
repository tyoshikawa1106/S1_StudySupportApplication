angular.module('sfdc1.controllers', [])

.controller('CW_StudyListCtrl', function($scope, Studies, $location, $rootScope) {
    Studies.all().then(function(studies) {
		$scope.studies = studies;
	});
})

.controller('CW_StudyListDetailCtrl', function($scope, $stateParams, Studies) {
	$scope.study = Studies.get($stateParams.studyId);

	Studies.getQuestions($stateParams.studyId).then(function(questions) {
		$scope.questions = questions;
	});

	$scope.clickResult = function(questionCnt) {

		var checkCnt = 0;
		var incorrectCnt = 0;
		var correctCnt = 0;
		var answerTotalCnt = $scope.questions[questionCnt].AnswerCnt__c;

		for (i = 0; i < $scope.questions[questionCnt].Choices_QuestionIds__r.length; i++) {
			var checked = $scope.questions[questionCnt].Choices_QuestionIds__r[i].checked;
			var answer = $scope.questions[questionCnt].Choices_QuestionIds__r[i].Answer__c;
						
			if(checked) {
				checkCnt++;
				console.log(checkCnt);
				if (answer == '正解') {
					correctCnt++;
				} else {
					incorrectCnt++;
				}
			}

			if(checkCnt == 0) {
				$scope.questions[questionCnt].result = '回答を選択してください';
			} else if (incorrectCnt > 0) {
				$scope.questions[questionCnt].result = '誤った回答を選択しています';
			} else if (correctCnt > 0) {
				if (correctCnt == answerTotalCnt) {
					$scope.questions[questionCnt].result = '正解です！！';
				} else {
					$scope.questions[questionCnt].result = '正しい回答は ' + answerTotalCnt + ' 件あります';
				}
			}
		}
	};
})