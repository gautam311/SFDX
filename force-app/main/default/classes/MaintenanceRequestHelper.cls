public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<Case> newRecords) {
        // TODO: Complete the method to update workorders
        List<Case> futureCases = new List<Case>();
        for(Case c: newRecords){
            if(c.IsClosed && (c.Type.equals('Repair') || c.Type.equals('Routine Maintenance'))){
               Case newCase = new Case();
                newCase.Vehicle__c = c.Vehicle__c;
                newCase.Equipment__c = c.Equipment__c;
                newCase.Type = 'Routine Maintenance';
                newCase.Subject = String.isBlank(c.Subject) ? 'Routine Maintenance Request' : c.Subject;
                newCase.Date_Reported__c = Date.today();
                newCase.Status = 'New';
                newCase.Product__c = c.Product__c;
                newCase.AccountId = c.AccountId;
                newCase.ContactId = c.ContactId;
                newCase.AssetId = c.AssetId;
                newCase.Origin = c.Origin;
                newCase.Reason = c.Reason;
                newCase.Date_Due__c = Date.today();
                futureCases.add(newCase);
            }
        }
        if(futureCases.size() > 0){
            insert futureCases;
        }
        
    }        
    
}