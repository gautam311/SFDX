@isTest
public class TestRestrictContactByName {
	@isTest
    static void testContactTriggerPOS(){
        // Positive Case Testing
        Contact con = new Contact();
        con.LastName = 'Doe';
        Test.startTest();
        Database.SaveResult result = Database.insert(con,false);
        Test.stopTest();
        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() == 0);
    }
    @isTest
    static void testContactTriggerNEG(){
        // Negative Case Testing
        Contact con = new Contact();
        con.LastName = 'INVALIDNAME';
        Test.startTest();
        Database.SaveResult result = Database.insert(con,false);
        Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
    }
}