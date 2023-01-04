@isTest
public class TestVisibleExampleTest {
    @isTest static void test1(){
        Integer i =TestVisibleExample.recordNumber;
        system.assertEquals(1, i);
        String out1 = TestVisibleExample.updateRecord('recordName');
        System.assertEquals('hello', out1);
    }
}