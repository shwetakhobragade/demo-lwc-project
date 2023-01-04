@isTest
public class TestOverwriteTestAccountDescriptions {
    static testMethod void verifyAccountDescriptionWhereOverwritten(){
        List<Account>accounts = new List<Account>{};
            for(Integer i=40;i<50;i++){
                Account a1=new Account(Name='SFDCTrigger255'+i);
                accounts.add(a1);
            }
        test.startTest();
        insert accounts;
        test.stopTest();
        List<Account>insertedAccounts =[SELECT Name,Description FROM Account where Id IN:accounts];
        for(Account a:insertedAccounts){
            system.assertEquals('This Account is probabaly left over from testing.it should probably be deleted.',a.Description);
        }
    }
}