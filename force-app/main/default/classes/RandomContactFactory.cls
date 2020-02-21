public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer firstPar, String secondPar){
        List<Contact> listOfCon = new List<Contact>();
        
        for(integer i=1;i<=firstPar;i++){
            Contact con = new Contact();
            con.FirstName = 'Test ' + i;
            con.LastName = secondPar;
           	listOfCon.add(con); 
        }
        return listOfCon; 
    }
}