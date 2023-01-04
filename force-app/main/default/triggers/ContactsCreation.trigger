trigger ContactsCreation on Account (After insert) {
list<contact>listContact= new list<contact>();
    map<id,decimal> mapAcc = new map<id,decimal>();
    for (Account acc:trigger.new)
    {
        mapAcc.put(acc.id,acc.NumberofLocations__c);
    }
    if (mapAcc.size()>0 && mapAcc!=null)
    {
        for(Id accId:mapAcc.keyset())
        {
            for(integer i=0;i<mapAcc.get(accId);i++)
            {
                contact newContact=new contact();
                newContact.accountid=accid;
                newContact.lastname='contact'+i;
                listcontact.add(newContact);
            }
        }
    }
    if(listcontact.size()>0 && listcontact!=null)
        insert listcontact;

}