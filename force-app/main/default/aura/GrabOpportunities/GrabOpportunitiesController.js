({
	handleClick : function(component, event, helper) {
         var action = component.get("c.getOppo");
		action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {  
                component.set("v.OppList",response.getReturnValue());
              
                    
                 
                 
                
            }
            else if (state === "INCOMPLETE") {
                
            }
                else if (state === "ERROR") {
                    
                }
        });  
        $A.enqueueAction(action);
	}
})