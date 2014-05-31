global with sharing class CW_StudyListController {
    
    global CW_StudyListController() {
        
    }
    
    @RemoteAction
    global static List<Study__c> getStudies() {
        return [
        	SELECT
        		 Id
        		,Name
        	FROM
        		Study__c 
            WHERE
            	IsPreparation__c != true
            ORDER BY Name ASC
            LIMIT 1000
        ];
    }

    @RemoteAction
    global static List<Question__c> getQuestions(String studyId) {
        return [
        	SELECT
        		 Id
        		,Name
        		,Content__c
                ,AnswerCnt__c
        		,(SELECT Id,Name,Content__c,Answer__c,Select__c FROM Choices_QuestionIds__r ORDER BY Name ASC)
        	FROM
        		Question__c 
            WHERE
            	StudyId__c =: studyId
            ORDER BY Name ASC
            LIMIT 1000
        ];
    }
}