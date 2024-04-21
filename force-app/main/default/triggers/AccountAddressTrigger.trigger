trigger AccountAddressTrigger on Account (before insert, before update) {
    if (Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            for (Account acc : Trigger.New){
                if(acc.Match_Billing_Address__c == True){
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
            }
        }
    }

}