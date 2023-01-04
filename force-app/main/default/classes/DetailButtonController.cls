public class DetailButtonController {
private ApexPages.StandardController standardcontroller;
    public string greeting {get; set;}
    public DetailButtonController(ApexPages.StandardController StandardController )
    {
        this.standardcontroller = standardcontroller;
    }
    public PageReference doSomething()
    {
        Id recordId = StandardController.getId();
        contact record = (contact)StandardController.getRecord();
        greeting='hello'+ record.id+''+record;
        return null;
    }
    
}