trigger AccountActions on Account (after insert) {
List<Contact> contactList = new List<Contact>();
    for (Account actobj :trigger.new)
    {
       
    }
}