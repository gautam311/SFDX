public class AccountTriggerHandler {
    public static void CreateAccounts (List<Account> acceptAcc){
        for(Account acc: acceptAcc){
            if(acc.ShippingState != acc.BillingState){
                acc.ShippingState = acc.BillingState;
            }
        }
    }
}