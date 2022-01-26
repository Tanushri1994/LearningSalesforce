trigger avoidUpdationOfConsultantFromEmployee on Consultant__c (before update) {
//avoid updation of consultant from employee to any other

    for(integer i=0; i<trigger.new.size(); i++){
        if(trigger.old[i].Type__c == 'Employee' && trigger.new[i].Type__c !='Employee' ){
            trigger.new[i].addError('You cannot change employee to any other type. Please conatct system Admin');
        }
    }
}