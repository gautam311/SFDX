global class LeadProcessor implements 
    Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID,LeadSource from Lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> updateLeads = new List<Lead>();
        for(Lead l: scope){
            l.LeadSource = 'DreamForce';
            updateLeads.add(l);
        }
		update updateLeads;
    }    
    global void finish(Database.BatchableContext bc){

    }    
}