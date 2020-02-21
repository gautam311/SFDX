trigger isGold on Opportunity (after insert, after update) {
    if(Trigger.isAfter){
    
        if(Trigger.isUpdate){
            List<Opportunity> updateAccount = new List<Opportunity>();
            for(Opportunity oldRec: Trigger.Old){
                if(oldRec.Amount >20000){
                    oldRec.Account.is_gold__c = true;
                    updateAccount.add(oldRec);
                }
            }
            update updateAccount;
            
        }
        
        /*
        if(Trigger.isInsert){
            List<Opportunity> updateAccount = new List<Opportunity>();
            for(Opportunity oldRec: Trigger.New){
                if(oldRec.Amount >20000){
                    oldRec.Account.is_gold__c = true;
                    updateAccount.add(oldRec);
                }
            }
            update updateAccount;
            
        }
        */
    }

}