@isTest
public class PositivePermission_tests {
    @TestSetup
    static void testSetup(){
        Account a = TestFactory.getAccount('No view For You!', true);
        Private_Object__c po = new Private_Object__c(account__c = a.id, notes__c = 'foo');
        insert po;
    }
    @isTest static void PermissionSetTest_Positive() {
        User u = TestFactory.generateUser('Custom User');
        System.runAs(u){
            Private_Object__c[] pos;
            Test.startTest();
            pos = [SELECT Id, Account__c, notes__c FROM Private_Object__c];
            Test.stopTest();
            system.assert(pos.size() != 0, 'a user can see the records');
        }
    }
}