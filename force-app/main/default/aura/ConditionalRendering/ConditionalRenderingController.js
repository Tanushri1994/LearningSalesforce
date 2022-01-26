({
	handleClick : function(component, event, helper) {
		var buttonName = event.getSource().get("v.label");
        if(buttonName == 'Create Contact'){
            component.set("v.CC",true);
             component.set("v.GO",false);
        }
        else{
             component.set("v.GO",true);
            component.set("v.CC",false);
        }
	}
})