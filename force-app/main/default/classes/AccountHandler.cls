public class AccountHandler {
    public static Account insertNewAccount(String inputAccName){ 
        Account acc =  new Account(Name = inputAccName);
    	try 
        {
 			insert acc;
            System.debug('Success');
            return acc;
        } catch (DmlException e){
            System.debug('error message: ' + e.getMessage());
            return null;
            
        }
        
    }
	
}