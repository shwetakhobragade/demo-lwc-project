trigger CreateContact on Account (after insert) {
if(Trigger.isInsert)
{
    list<Contact>lstContacts=new List<Contact>();
    for(Account acc:Trigger.new)
    {
        contact cnt = new Contact(LastName =acc.Name,AccountId = acc.Id);
        lstContacts.add(cnt);
    }
    insert lstContacts; 
}
}