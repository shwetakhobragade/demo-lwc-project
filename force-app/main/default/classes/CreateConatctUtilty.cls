public class CreateConatctUtilty {
    public static void CreateContacts(List<account>lstAccounts)
    {
        system.debug('Account::'+lstAccounts);
        List<contact> lstContacts =new List<contact>();
        if(lstAccounts.size()>0)
        {
            for(Account acc:lstAccounts)
            {
                contact cnt=new contact(lastname=acc.name,AccountId= acc.Id);
                lstContacts.add(cnt);
                
            }
            insert lstContacts;
            
        }
            
    }
}