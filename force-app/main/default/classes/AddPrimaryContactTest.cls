@IsTest
public class AddPrimaryContactTest {
	@IsTest
    static void testQueueable() {
        //query for test data to pass to queueable class
		String abr = 'TX';
        List<Account> accounts = new List<Account>();
        // add a parent account
        accounts.add(new Account(name='Parent'));
        // add 100 child accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,
                BillingState = abr
            ));
        }
        insert accounts;
        List<Contact> newCon = new List<Contact>();
        Contact con = new Contact();
      	for(Account acc: [select id,BillingState from Account where BillingState =: abr limit 50])
        {
            
            con.AccountId = acc.Id;
            con.LastName = 'test';
            newCon.add(con);
        }
		//insert newCon;
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(con, abr);
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
        System.assertEquals(50, [select count() from account where BillingState = :abr]);
    }
}