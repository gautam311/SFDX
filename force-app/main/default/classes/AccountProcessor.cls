public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> updateAccounts = new List<Account>();
        for(Account acc: [select id,Number_of_Contacts__c from Account where id IN: accountIds])
        {
            List<AggregateResult> numberOfContacts  = [select COUNT(Id) from Contact where AccountId =: acc.Id];
            acc.Number_of_Contacts__c = (integer)numberOfContacts[0].get('expr0');
            updateAccounts.add(acc);
        }
        update updateAccounts;       
        
    }
}