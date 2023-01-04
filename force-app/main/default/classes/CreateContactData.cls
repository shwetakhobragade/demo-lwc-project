public class CreateContactData {
@AuraEnabled
    public static string CreateContact(contact contobj){
        system.debug('contact::'+contobj.FirstName);
        insert contobj;
        return contobj.Id;
    }   
}