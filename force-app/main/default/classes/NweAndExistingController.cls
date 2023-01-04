public class NweAndExistingController {
    public Account account{get; private set;}
    
    public NweAndExistingController() {
        Id id = ApexPages.currentPage().getParameters().get('id');
        account = (id==null)? new account():
         [SELECT Name,Phone, Industry FROM Account WHERE Id = :id ];
            
    }
  Public PageReference save(){
        try{
            upsert(account);
        }  catch(system.DMLException e){
           ApexPages.addMessages(e);
           return null;
        }
      PageReference redirectsucces = new ApexPages.StandardController(Account).view();
      return (redirectSucces);
    }
}