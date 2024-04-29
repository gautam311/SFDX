@isTest
public class LeadProcessorTest {
	@isTest
    static void testLeadProcessor(){
        List<Lead> insertNew = new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead nLead = new Lead();
            nLead.LastName = 'test Lead ' + i;
            nLead.Company = 'Test Company';
            insertNew.add(nLead);
        }
        insert insertNew;
        Test.startTest();
        LeadProcessor newInstance = new LeadProcessor();
        Id batchId = Database.executeBatch(newInstance);
        Test.stopTest();
        System.assertEquals(200, [select count() from lead where LeadSource = 'DreamForce'], 'Successful');
    }
}