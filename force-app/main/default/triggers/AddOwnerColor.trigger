trigger AddOwnerColor on Account (before insert,before update) {
set<id> ownerIds=new set<id>();
    for(Account a:Trigger.new)
        ownerIds.add(a.OwnerId);
    Map<id,User>  Owners=new Map<id,User>([select Favorite_color__c from User Where Id in:ownerIds]);
        for(Account a:Trigger.new)
        a.Favorite_color__c = owners.get(a.OwnerId).Favorite_color__c;
}