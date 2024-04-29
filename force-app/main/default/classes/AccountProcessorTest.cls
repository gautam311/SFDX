@IsTest
public class AccountProcessorTest {
	@IsTest
    private static void testAccountProcess(){
        /*
        List<Account> accts = new List<Account>();
        List<Id> allIds = new List<Id>();
        for(Integer i=0;i<200;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
            allIds.add(a.Id);
        }
        insert accts;
        
        List<Contact> con = new List<Contact>();
        for (Integer j=0;j<200;j++) {
            Account acct = accts[j];
            // For each account just inserted, add contacts
            for (Integer k=0;k<2;k++) {
                con.add(new Contact(LastName=acct.Name + ' Contact ' + k,AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert con;
        System.debug('Test Class');
        System.debug(allIds);
		*/
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        insert newAcc;
        Id a = newAcc.Id;
        List<Id> getAcc = new List<Id>();
        getAcc.add(a);
        Contact newCon = new Contact();
        newCon.LastName = 'Test';
        newCon.AccountId = a;
        insert newCon;
        Test.startTest();
        AccountProcessor.countContacts(getAcc);
        Test.stopTest();
        
    }
}