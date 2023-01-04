public class OportunityHandler {
    public Static void Opportunity(List<Opportunity>OpportunityoldList,List<Opportunity>OpportunitynewList)
    {
         
        
        for (Opportunity OldOpp:OpportunityoldList)
        
    {
        for (Opportunity NewOpp:OpportunitynewList)
        {
            if(OldOpp.id ==NewOpp.id && OldOpp.Amount != NewOpp.Amount)
                NewOpp.addError('Amount cannot be changed');
        }      
            
    }
    }
}