public class StringArrayTest {
    public static List<String> generateStringArray(Integer numOfStrings){
        List<String> strList = new List<String>();
        for(Integer i = 0;i<numOfStrings;i++){
            strList.add('Test ' + i);
        }
        System.debug(strList);
        return strList;
    }

}