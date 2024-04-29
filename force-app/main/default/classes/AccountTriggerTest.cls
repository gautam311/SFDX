@isTest
public class AccountTriggerTest {
	@isTest
    static void createAccountsTest(){
        List<Account> testAccounts = new List<Account>();
        for(Integer i=1;i<=200;i++){
            Account acc = new Account();
            acc.Name = 'Test ' + i;
            acc.BillingState = 'CA';
            testAccounts.add(acc);
        }
        insert testAccounts;
        AccountTriggerHandler.CreateAccounts(testAccounts);
    }
}