public class PracticeWrapperClass {
    public wrapperClass objWrapper {get;set;} //Initialize
    
    public PracticeWrapperClass() { //constructor
        objWrapper = new wrapperClass(); //create a new object
        objWrapper.name = 'Me';
        objWrapper.height = 5.4;
    }
    //wrapper class holding different data type values
    public class wrapperClass{
        public String name {get;set;}
        public Decimal height {get;set;}
        
    }
}