@isTest
public class TestVerifyDate {
	@isTest
    static void testCheckDatesCase1(){
        // Positive Case Test
        // Date 2 is within the next 30 days
        Date result = VerifyDate.CheckDates(Date.newInstance(2019, 10, 01),Date.newInstance(2019, 10, 25));
        System.assertEquals(Date.newInstance(2019, 10, 25), result);
    }
    @isTest 
    static void testCheckDatesCase2(){
        // Negative Case Test
        // Date 2 is not within the next 30 days
        Date result = VerifyDate.CheckDates(Date.newInstance(2019,12,05),Date.newInstance(2020,01,25));
        System.assertEquals(Date.newInstance(2019, 12, 31), result);
        
    }
    //No need to check the other two methods since the CheckDate method has a reference to them
    //Private methods cant be tested on
}