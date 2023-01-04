@isTest
public class TestRunAsProfile {
    public static testMethod void testRunAs(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Salesperson'];
        User u=new User (Alias ='calva2',Email='anagha_pathak@persistent.com',
               EmailEncodingkey='UTF-8',LastName='alvarez',LanguageLocaleKey='en_Us',LocaleSidKey='en_US',
                         ProfileId=p.Id,TimeZoneSidKey='America/Los_Angeles',UserName='cathay_alvarez2@training.new');
        System.runAs(u){
            system.debug('Current User:'+UserInfo.getUserName());
            System.debug('Current Profile:'+UserInfo.getProfileId());
        }
    }
}