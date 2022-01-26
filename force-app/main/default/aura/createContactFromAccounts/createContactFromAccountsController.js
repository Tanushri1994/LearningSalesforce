({
    handleClick : function(component, event, helper) {
        var firstname = component.find("fname").get("v.value");
        var lastname = component.find("lname").get("v.value");
        var phone = component.find("phone").get("v.value");
        var email = component.find("email").get("v.value");
        var accId = component.get("v.recordId");
        var action = component.get("c.createCon");
       
        action.setParams({ fname : firstname,lname :lastname, phone:phone,email:email,accountId:accId});         
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {        
                $A.get("e.force:closeQuickAction").fire();
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": response.getReturnValue()
                    
                });
                navEvt.fire();
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": "The record has been updated successfully.",
                    "type":"success",
                    "mode": "sticky"
                });
                toastEvent.fire();    
                $A.get('e.force:refreshView').fire();
                
            }
            else if (state === "INCOMPLETE") {
                
            }
                else if (state === "ERROR") {
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Error!",
                        "message": "Please correct the error",
                        "type":"error",
                        "mode": "pester"
                    });
                    toastEvent.fire();    
                }
        });  
        $A.enqueueAction(action);
        
        
    }
})