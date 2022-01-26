({
    
    doInit : function(component, event, helper) {
        var Id =  component.get("v.recordId");
         
       var action = component.get("c.handleTicketStatus");
        action.setParams({ ticketId:Id });
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS" ) {        
                if(response.getReturnValue()){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Info!",
                        "message": "You can not create ticket for past dated concert.",
                        "type":"info",
                        "mode": "sticky"
                    });
                    toastEvent.fire();             
                    
                  
                }
                else{
                    var createRecordEvent = $A.get("e.force:createRecord");
                    createRecordEvent.setParams({
                        "entityApiName": "Ticket__c"
                    });
                    createRecordEvent.fire();
                      $A.get('e.force:refreshView').fire();
                }
                
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