trigger NewInvoice on Invoice1__c(after insert,after update) {
     if((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isAfter)){
            InvoiceHandler.invoiceHandlerMethod(Trigger.new);
        }
    {
  
        if((Trigger.isInsert && Trigger.isAfter)||(Trigger.isUpdate && Trigger.isAfter)){
         InvoiceHandler.handlerMethod(Trigger.new);
        }
    }
    }