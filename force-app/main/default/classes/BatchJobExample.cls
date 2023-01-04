global class BatchJobExample implements Database.Batchable<sobject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query ='SELECT id,name,from Account';
        return Database.getQueryLocator(query);
    }
        global void Execute (Database.BatchableContext BC,List<Account>accList){
            for(Account acc:accList){
                acc.Name = acc.Name +'Vamritech';
        
            }
            try{
                update accList;
            }catch(Exception e){
                system.debug('e');
            }
        }
    global void finish(Database.BatchableContext BC){
        
    } 
}