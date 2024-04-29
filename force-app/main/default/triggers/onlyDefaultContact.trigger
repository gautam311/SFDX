trigger onlyDefaultContact on Account (before insert,after insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            for(Account acc:Trigger.new)
            {
                List<Contact> countContactsfromACC = [select id, AccountId from Contact where AccountId=:acc.Id limit 2];
                if(countContactsfromACC.size() > 1){
                    acc.Only_Default_Contact__C = false;
                }else{
                    acc.Only_Default_Contact__C = true;
                }
            }
        }
    }
    if(Trigger.isAfter){ 
        List<Contact> newContacts = new List<Contact>();
        if(Trigger.isInsert){
            for(Account acc:Trigger.new)
            {
                Contact con = new Contact();
                con.FirstName= 'Info';
                con.LastName= 'Default';
                con.Email = 'info@websitedomain.tld';
                con.AccountId = acc.Id;
                newContacts.add(con); 
            }
            insert newContacts;
            
        }
          
    }
    
}