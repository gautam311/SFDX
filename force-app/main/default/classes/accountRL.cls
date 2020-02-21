public with sharing class accountRL {
    @AuraEnabled
    public static Object getAccounts(Id recId){
        Object Accountdata = [select id, Name from account where id=:recId];
        return Accountdata;
    }
    
}