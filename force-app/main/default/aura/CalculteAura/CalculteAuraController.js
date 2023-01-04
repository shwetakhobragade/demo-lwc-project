({
	sum : function(component, event, helper) {
	var v1 = component.find("txt1").get("v.value");	
    var v2 = component.find("txt2").get("v.value");
    var v3=parseInt(v1)+parseInt(v2);
         component.set("v.actionName","Addition");
        component.set("v.result",v3);
        
	} ,
    
    sub : function(component, event, helper) {
	var v1 = component.find("txt1").get("v.value");	
    var v2 = component.find("txt2").get("v.value");
    var v3=parseInt(v1)-parseInt(v2);
         component.set("v.actionName","subtract");
        component.set("v.result",v3);
        
	} ,
    mul: function(component, event, helper) {
	var v1 = component.find("txt1").get("v.value");	
    var v2 = component.find("txt2").get("v.value");
    var v3=parseInt(v1)*parseInt(v2);
         component.set("v.actionName","multiplication");
        component.set("v.result",v3);
        
	} ,
    div : function(component, event, helper) {
	var v1 = component.find("txt1").get("v.value");	
    var v2 = component.find("txt2").get("v.value");
    var v3=parseInt(v1)/parseInt(v2);
         component.set("v.actionName","division");
        component.set("v.result",v3);
        
	} 
})