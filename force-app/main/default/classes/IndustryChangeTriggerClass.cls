public class IndustryChangeTriggerClass {
    // This method is called from the MasterLeadTrigger
    public String doIndustryChange(List<Lead> listOfNewLeads) {
        // return value and totalUpdates to staisfy unit test classes
        String returnValue='';
        Integer totalUpdates = 0;
        // try/catch block to catch any exceptions thrown from system or from code
        try{
            // looping through all of the lead records that are updated
            for (Lead newLead : listOfNewLeads) {
                // if using picklist values -  REMOVE BEFORE PUSHING TO PRODCUTION
                String leadIndustry = newLead.Industry;
                String newIndustryField;
                if(String.isNotBlank(leadIndustry)){
                    newIndustryField = leadIndustry.replace('_',' '); 
                }
                // querying from the ZoomInfo custom metadata to query for industry category if the industry description matches with the value of that on the Lead
                List<ZoomInfoIndustry__mdt> getMetaData = [select id,Industry_Category__c,Industry_Description__c from ZoomInfoIndustry__mdt where Industry_Description__c =: newIndustryField limit 1];
                //Use if not using picklist value
                //List<ZoomInfoIndustry__mdt> getMetaData = [select id,Industry_Category__c,Industry_Description__c from ZoomInfoIndustry__mdt where Industry_Description__c =: newLead.Industry limit 1];
                
                // Error handling, make sure that the list has at least 1 item or exception will be thrown on line 24
                if(getMetadata.size() > 0){
                    // Error handling, checking to make sure that two values are actually equal
                    if(getMetaData[0].Industry_Description__c == newIndustryField){
                        System.debug('List');
                        System.debug(getMetaData);
                        System.debug('Industry Field from Lead');
                        System.debug(newLead.Industry);
                        // assign the Lead Industry Category field to the value pulled from the ZoomInfo custom metadata
                        newLead.Industry_Category__c = getMetaData[0].Industry_Category__c ;
                        totalUpdates = totalUpdates +1;
                    }
                }else{
                    // if the list does not any items then make the Industry category field blank
                    newLead.Industry_Category__c = null;                    
                }
            }
        // used for catching exceptions
        }catch (Exception e){
            System.debug('Error: ' + e);
        }
        if(totalUpdates > 0){
            returnValue = 'Successful';
        }else{
            returnValue = 'Unsuccessful';
        }
        return returnValue;
    }
}