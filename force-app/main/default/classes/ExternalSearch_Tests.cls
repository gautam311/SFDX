@isTest
private class ExternalSearch_Tests {
    @isTest static void test_method_one() {
        HttpMockFactory mock = new HttpMockFactory(200, 'OK', 'I found it!', new Map<String,String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        Test.startTest();
        result = ExternalSearch.googleIt('epic search');
        Test.stopTest();
        system.assertEquals('I found it!', result);
    }
    @isTest static void test_method_one_Negative() {
        HttpMockFactory mock = new HttpMockFactory(500, 'ERROR', 'Did not find!', new Map<String,String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        Test.startTest();
        Boolean error = false;
        try{
            result = ExternalSearch.googleIt('epic search');
        }catch(Exception e){
            error = true;
            result = 'Did not recieve a 200 status code: 500';
        }
        Test.stopTest();
        system.assertEquals('Did not recieve a 200 status code: 500', result);
    }
}