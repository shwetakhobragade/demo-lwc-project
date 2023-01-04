public class CreateContactsUtility {
public static void CreateContacts(List<account> lstAccounts)
{
    List<Contact>lstContacts=new List<contact>();
    if(lstAccounts.size()>0 )
    {
        for(Account acc:lstAccounts)
        {
            contact cnt=new contact(LastName=acc.Name,AccountId= acc.Id);
            lstContacts.add(cnt);
        }
        insert lstContacts;
    }
}
}