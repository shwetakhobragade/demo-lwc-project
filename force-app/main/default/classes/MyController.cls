public class MyController {
    
private final Account account;
    
    public MyController(){
        account=[SELECT Id,Name,Site FROM Account
                 Where id =:Apexpages.currentPage().getParameters().get('id')];
    }
    public Account getAccount(){
        return account;
    }
    public PageReference save(){
        update account;
        return null;
    }
}