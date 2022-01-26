trigger ErrorOnDeleteApprovedReuirement on Requirement__c (before delete) {
    for(Requirement__c req : Trigger.old){
        if(req.status__c == 'Approved'){
            req.addError('You cannot delete requirement with approved status' );
        }
    }
}