@isTest
public class AccountProcessorTest {
	@isTest
    static void testcountContacts(){
       //Insert some Account/Contact test data
        List<Account> insertListOfAccounts = new List<Account>();
        List<Id> accountIds = new List<Id>();
        List<Contact> insertListOfContacts = new List<Contact>();
        for(Integer i=1;i<=200;i++){
            Account newAccount = new Account(Name = 'Test Account ' + i);
            insertListOfAccounts.add(newAccount);
            accountIds.add(newAccount.Id);
            Contact newContact = new Contact(AccountId = newAccount.Id,LastName= 'Test');
            insertListOfContacts.add(newContact);
        }
        insert insertListOfAccounts;
        insert insertListOfContacts;
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        
    }
}