({
	doSave : function(component, event, helper) {
		var action = component.get("c.CreateContact");
        action.setParams({'contobj':component.get('v.contactobj')});
        action.setCallback(this,function(data){
            component.set('v.contactId',data.getReturnValue())
        });
       $A.enqueueAction(action);
	}
})