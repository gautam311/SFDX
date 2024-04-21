@isTest
public class Calculator_Tests {
    @isTest
    static void TestPositiveAddition(){
        Integer a = 2;
        Integer b = 3;
        Test.startTest();
        Integer results = Calculator.addition(a, b);
        Test.stopTest();
        System.assertEquals(5, results, 'The result is correct');
    }
    @isTest
    static void TestNegativeAddition(){
        Integer a;
        Integer b = 3;
        Test.startTest();
        Boolean catchError = false;
        try{
            Integer results = Calculator.addition(a, b);
        }catch(Exception e){
            catchError = true;
        }
        Test.stopTest();
        System.assertEquals(true, catchError, 'The result is incorrect and is caught by the try/catch');
    }
    @isTest
    static void TestPositiveSubtraction(){
        Integer a = 3;
        Integer b = 1;
        Test.startTest();
        Integer results = Calculator.subtraction(a, b);
        Test.stopTest();
        System.assertEquals(2, results, 'The result is correct');
    }
    @isTest
    static void TestNegativeSubtraction(){
        Integer a;
        Integer b = 3;
        Test.startTest();
        Boolean catchError = false;
        try{
            Integer results = Calculator.subtraction(a, b);
        }catch(Exception e){
            catchError = true;
        }
        Test.stopTest();
        System.assertEquals(true, catchError, 'The result is incorrect and is caught by the try/catch');
    }
    @isTest
    static void TestPositiveMultiply(){
        Integer a = 3;
        Integer b = 1;
        Test.startTest();
        Integer results = Calculator.multiply(a, b);
        Test.stopTest();
        System.assertEquals(3, results, 'The result is correct');
    }
    @isTest
    static void TestNegativeMultiply(){
        Integer a = 0;
        Integer b = 3;
        Test.startTest();
        Boolean catchError = false;
        try{
            Integer results = Calculator.multiply(a, b);
        }catch(Exception e){
            catchError = true;
        }
        Test.stopTest();
        System.assertEquals(true, catchError, 'The result is incorrect and is caught by the try/catch');
    }
    @isTest
    static void TestPositiveDivide(){
        Integer a = 3;
        Integer b = 1;
        Test.startTest();
        Decimal results = Calculator.divide(a, b);
        Test.stopTest();
        System.assertEquals(3, results, 'The result is correct');
    }
    @isTest
    static void TestNegativeDivide(){
        Integer a = 3;
        Integer b = 0;
        Test.startTest();
        Boolean catchError = false;
        try{
            Decimal results = Calculator.divide(a, b);
        }catch(Exception e){
            catchError = true;
        }
        Test.stopTest();
        System.assertEquals(true, catchError, 'The result is incorrect and is caught by the try/catch');
    }
    @isTest
    static void TestNegativeDivide2(){
        Integer a = 3;
        Integer b = -1;
        Test.startTest();
        Boolean catchError = false;
        try{
            Decimal results = Calculator.divide(a, b);
        }catch(Exception e){
            catchError = true;
        }
        Test.stopTest();
        System.assertEquals(true, catchError, 'The result is incorrect and is caught by the try/catch');
    }
}