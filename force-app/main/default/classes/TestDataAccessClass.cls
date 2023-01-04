@isTest(seeAllData=true)
public class TestDataAccessClass {
    static testmethod void myTestMethod1(){
        account a =[SELECT Id,Name FROM Account WHERE Name='Acme'LIMIT 1];
        System.assert(a!=null);
        Account testAccount =a.clone();
        testAccount.Name='Acme Test4';
        insert testAccount;
        Account testAccount2=[SELECT Id,Name FROM Account WHERE Name='Acme Test4'LIMIT 1];
        System.assert(testAccount2!=null);
    }
    
}