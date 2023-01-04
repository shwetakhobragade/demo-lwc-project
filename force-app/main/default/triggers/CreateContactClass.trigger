trigger CreateContactClass on Account (After insert) 
{

    CreateContactsUtility.CreateContacts(Trigger.new);

}