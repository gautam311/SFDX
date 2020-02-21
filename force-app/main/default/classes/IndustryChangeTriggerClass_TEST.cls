@isTest
public class IndustryChangeTriggerClass_TEST {
    @isTest
    static void positiveTest(){
        //Insert some test data
        List<Lead> insertListOfLeads = new List<Lead>();
        for(Integer i=1;i<=200;i++){
            Lead newLead = new Lead(Industry = 'Banking',LastName = 'Test Last Name',Company = 'Test Company ' + i);
            insertListOfLeads.add(newLead);
        }
        //Lead newLead = new Lead(Industry = 'Banking',LastName = 'Test Last Name',Company = 'Test Company');
        //insertListOfLeads.add(newLead);
        insert insertListOfLeads;
        Test.startTest();
        List<Lead> ListLeadRec = new List<Lead>([select id from Lead where Industry='Banking']);
		IndustryChangeTriggerClass updateLead = new IndustryChangeTriggerClass();
        updateLead.doIndustryChange(insertListOfLeads);
        System.assertEquals('Successful', updateLead.doIndustryChange(insertListOfLeads));
        Test.stopTest();   
    }
    @isTest
    static void negativeTest(){
        //Insert some test data
        List<Lead> insertListOfLeads = new List<Lead>();
        for(Integer i=1;i<=200;i++){
            Lead newLead = new Lead(LastName = 'Test Last Name',Company = 'Test Company ' + i);
            insertListOfLeads.add(newLead);
        }
        //Lead newLead = new Lead(Industry = 'Banking',LastName = 'Test Last Name',Company = 'Test Company');
        //insertListOfLeads.add(newLead);
        insert insertListOfLeads;
        Test.startTest();
        List<Lead> ListLeadRec = new List<Lead>([select id from Lead where Industry='Banking']);
		IndustryChangeTriggerClass updateLead = new IndustryChangeTriggerClass();
        updateLead.doIndustryChange(insertListOfLeads);
        System.assertEquals('Unsuccessful', updateLead.doIndustryChange(insertListOfLeads));
        Test.stopTest();   
    }
}