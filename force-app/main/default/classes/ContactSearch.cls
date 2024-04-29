public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode){
        List<Contact> listofCon  = new List<Contact>([select Id, Name from Contact where lastName=:lastName and MailingPostalCode=:mailingPostalCode]);
        return listofCon;
        
    }
}