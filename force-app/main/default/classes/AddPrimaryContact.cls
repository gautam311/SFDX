public class AddPrimaryContact implements Queueable {
	private Contact contacts;
    private String stateABR;
    
    public AddPrimaryContact(Contact records, String abr) {
        this.contacts = records;
        this.stateABR = abr;
    }
    public void execute(QueueableContext context) {
        List<Contact> insertCon = new List<Contact>();
        for(Account acc: [select id,BillingState from Account where BillingState =: stateABR limit 200])
        {
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = 'test';
            insertCon.add(con);
        }
		insert insertCon;
    }
}