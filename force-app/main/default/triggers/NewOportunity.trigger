trigger NewOportunity on Opportunity (before update) {
    
    if(trigger.isbefore && trigger.isupdate){
    
        OportunityHandler.Opportunity(trigger.New,trigger.old );	
    }
}