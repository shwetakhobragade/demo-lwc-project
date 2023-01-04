({
	doInit : function(component, event, helper) {

        var accid = component.get("v.recordId");
        component.set("v.contact.AccountId",component.get("v.recordId"));
        var action=component.get("c.getAccount");
        action.setParams({
            acid : component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.account",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    InsertCont : function(component){
        var action=component.get("c.insertCon");
        action.setParams({ "newcon": component.get("v.contact") });
        action.setCallback(this, function(response)
                           {
                               var state = response.getState();
                               if (state === "SUCCESS")
                               {
                                   var contactid=response.getReturnValue().Id;
                                   alert("contact created.Id:"+contactid)
                                   var toastEvent = $A.get("e.force:showToast");
                                   toastEvent.setParams({
                                       "title": "Success!",
                                       "message": "Contact record Created successfully.",
                                       "mode":"pester"
                                   });
                                   toastEvent.fire();
                                   var navEvt = $A.get("e.force:navigateToSObject");
                                   navEvt.setParams({
                                       "recordId": contactid,
                                       "slideDevName": "related"
                                   });
                                   navEvt.fire();
                               }
                           });
        $A.enqueueAction(action);
    }
})