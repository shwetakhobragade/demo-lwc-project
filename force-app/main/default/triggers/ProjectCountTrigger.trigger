trigger ProjectCountTrigger on Building_Project__c (after insert,after update,after delete) {
  if(Trigger.isafter){ 
      if(Trigger.isinsert || Trigger.isupdate){
        CountProjectsClass.handlerMethod(trigger.new);
      }
        if(Trigger.isupdate || Trigger.isdelete){
         CountProjectsClass.handlerMethod(trigger.old);  
        }   
    }
}