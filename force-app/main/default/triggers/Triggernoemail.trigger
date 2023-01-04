trigger Triggernoemail on Contact (before insert) {
    for(contact c:trigger.new){
        if(c.department==null){
            system.debug('could not update last survey sent field on Account with cause:');
        }
    }
}