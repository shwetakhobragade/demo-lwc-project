trigger ondelete on Account (before delete) {
    for(Account a:[SELECT Id FROM Account WHERE Id IN:Trigger.old]){
        Trigger.oldMap.get(a.Id).addError('Cannot delete account with related contacts.');
    }
}