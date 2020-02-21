public class AccountUtils {
    public static List<Account> accountsByState (String stateABR){
        List<Account> result = [select id,name from account where BillingState =: stateABR];
        return result;
    }
}