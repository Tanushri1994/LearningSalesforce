// Avoid deletion of Employee record is Department’s status is ‘Active’

trigger avoidDeletionEmployee on Employee__c (before delete) {
    //grab all employee id from Trigger
    List<Id> empId = new List<Id>();
    for(Employee__c emp : Trigger.old){
        empId.add(emp.Department__c);
    }
    
   
     List<Id> activeDeptList = new List<Id>();
    for(Department__c dept :[SELECT Id, Name, Status__c FROM Department__c where
                                 Status__c ='Active' and Id IN :empId]){
        activeDeptList.add(dept.Id);
    }
    
    for(Employee__c empl : Trigger.old){
        if(activeDeptList.contains(empl.Department__c)){
           empl.addError('You can not delete employee which belongs to Active department'); 
        }
    }
}