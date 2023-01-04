public class MyControllerExtension1 {
private final Account acct;
    public MyControllerExtension1(ApexPages.StandardController stdcontroller){
        this.acct =(account)stdcontroller.getRecord();
    }
    Public string getGreeting(){
        return 'Hello'+ acct.Name +'('+acct.Id +')';
    }
}