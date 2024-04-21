public class AccountProcessor {
    @future
    public static void countContacts (List<Id> accountIds){
        System.debug('Account Ids');
        System.debug(accountIds);
        List<Account> allAccounts = [select Id, Number_of_Contacts__c from Account where Id IN: accountIds];
    	AggregateResult allContacts = [select AccountId, COUNT(id) from Contact where AccountId IN: accountIds GROUP BY AccountId]; 
        List<Account> updateRecords = new List<Account>();
        for (Account acc: allAccounts){
            if(acc.Id == ((ID)allContacts.get('AccountId'))){
                acc.Number_of_Contacts__c = ((Integer)allContacts.get('expr0'));
                updateRecords.add(acc);
            }
        }
        update updateRecords;
    }
}