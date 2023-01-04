trigger OverWriteTestAccountDescriptions on Account (before insert) {
    for(Account a:Trigger.new){
        if (a.name.contains('SFDCTrigger255')){
            system.debug('test debug');
            a.Description='This Account is probably left over from testing.It should probably be deleted.';
        }
    } 
}