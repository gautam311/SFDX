@isTest
public class DailyLeadProcessorTest {
	@isTest
    public static void testDailyLeadProcessor(){
        List<Lead> newLeadCreation = new List<Lead>();
        for(Integer i=0;i<200;i++){
            Lead newL = new Lead();
            newL.LastName = 'Test ' + i;
            newL.Company = 'Test Company';
            newLeadCreation.add(newL);
        }
        insert newLeadCreation;
        Test.startTest();
       	String CRON_EXP = '0 0 0 15 3 ? 2022';
        DailyLeadProcessor newInstance = new DailyLeadProcessor();
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP, newInstance);
        List<Lead> getRes = [select id, LeadSource from Lead where id IN :newLeadCreation AND LeadSource='DreamForce' limit 200];
        System.assertEquals(0, getRes.size());
        Test.stopTest();
    }
}