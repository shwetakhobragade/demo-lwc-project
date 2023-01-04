public class InvoiceHandler {
public static void invoiceHandlerMethod(List<Invoice1__c> invoiceList){
        set<Id> accSet = new set<Id>();
        for(Invoice1__c invoiceObj:invoiceList){
            if(invoiceObj.Account__c!=null){
                accSet.add(invoiceObj.Account__c);
            }
        }
        Map<Id, Double> accMap=new Map<Id, Double>();
        List<AggregateResult> aggResult= [SELECT Account__c,Sum(invoice_ammount__c) Amount FROM Invoice1__c WHERE Account__c  IN : accSet AND invoice_date__c = THIS_YEAR Group by Account__c];
        for(AggregateResult aggRes:aggResult){
            Id accountId=(Id)aggRes.get('Account__c');
            double sumAmount=(double)aggRes.get('Amount');
            accMap.put(accountId,sumAmount);
        }
        List<Account> accList=new List<Account>();
        for(Id key:accMap.KeySet()){
            Account acc= new Account();
            acc.id=key;
            acc.current_year_invoice__c=accMap.get(acc.id);
            accList.add(acc);
        }
        Update accList;
    }

      public static void handlerMethod(List<Invoice1__c> invoiceList1){
        set<Id> accSet1 = new set<Id>();
        for(Invoice1__c invoiceObj1: invoiceList1){
            if(invoiceObj1.Account__c!=null){
                accSet1.add(invoiceObj1.Account__c);
            }
        }
        Map<Id, Double> accMap=new Map<Id, Double>();
        List<AggregateResult> aggResult= [SELECT Account__c,Sum(invoice_ammount__c) Amount FROM Invoice1__c WHERE Account__c  IN : accSet1 AND invoice_date__c =LAST_YEAR Group by Account__c];
        for(AggregateResult aggRes:aggResult){
            Id accountId=(Id)aggRes.get('Account__c');
            double sumAmount=(double)aggRes.get('Amount');
            accMap.put(accountId,sumAmount);
        } 
        
        List<Account> accList=new List<Account>();
        for(Id key:accMap.KeySet()){
            Account acc= new Account();
            acc.id=key;
            acc.last_invoice_ammount__c=accMap.get(acc.id);
            accList.add(acc);
        }
        
        Update accList;
        
    }
}