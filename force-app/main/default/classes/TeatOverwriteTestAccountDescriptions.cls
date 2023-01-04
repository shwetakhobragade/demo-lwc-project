@isTest
public class TeatOverwriteTestAccountDescriptions {
    Static testMethod void verifyAccountDescriptionsWherewOverwritten(){
        List<Account> accounts=new List<Account>{};
            for(integer i=40;i<50;i++) {
                Account a1=new Account(Name='SFDCTrigger255'+i);
                accounts.add(a1);
            }
        test.startTest();
        insert accounts;
        test.stopTest();
        list<Account> insertedAccounts=[SELECT Name,Description FROM Account WHERE Id IN:accounts];
        for (Account a: insertedAccounts){
            system.assertEquals('This Account is probably left over from testing.It should probably be deleted.',a.Description);
        }
    }
}