trigger NewAccount on Account (before update,after update) {
 
    if(trigger.isBefore && trigger.isupdate)
    {
        for(Account acc:trigger.new)
        {
            
       system.debug('new name is'+acc.name);   
       system.debug('old name is'+trigger.oldMap.get(acc.id).name );
                    
        }      
                   
    }    
}