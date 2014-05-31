@isTest
private class CW_StudyListControllerTest {

    static testMethod void CW_StudyListControllerTest() {
        
        Test.startTest();
        
        CW_StudyListController cls = new CW_StudyListController();
        
        Test.stopTest();
    }

    static testMethod void getStudiesTest() {
        
        Test.startTest();
        
        List<Study__c> results = CW_StudyListController.getStudies();
        System.assertEquals(results.isEmpty(), true);
        
        Test.stopTest();
    }

    static testMethod void getQuestionsTest() {
        
        Test.startTest();
        
        String studyId = '';
        List<Question__c> results = CW_StudyListController.getQuestions(studyId);
        System.assertEquals(results.isEmpty(), true);
        
        Test.stopTest();
    }
}