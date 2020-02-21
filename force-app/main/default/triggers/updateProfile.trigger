trigger updateProfile on Account (after update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            for(Account oldRec : Trigger.Old){
                List<Contact> getContacts = [select id,Profile__c from contact where AccountId=:oldRec.Id];
                if(oldRec.Website != null){
                    for(Contact con: getContacts){
                         con.Profile__c=oldRec.Website + '/' + oldRec.Name;                   
                    }
                    update getContacts;
                }
            }
        }
    }
    

}