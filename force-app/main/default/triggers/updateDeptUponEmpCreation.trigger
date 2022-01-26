trigger updateDeptUponEmpCreation on Employee__c (after insert,after update) {
    
Set<Id> empDeptId = new Set<Id>();
    
    for(Employee__c emp : Trigger.new){  
        
        if(emp.Department__c != null){
           empDeptId.add(emp.Department__c);  
        }
                        
    }
    List<Department__c> deptList = new List<Department__c>();
    for(Department__c dept : [Select Id, Name,(Select Id from Employees__r) from Department__c where Id IN :empDeptId]){
        List<Employee__c> empList = dept.Employees__r;
        dept.Count_of_Employee__c = empList.size();
        deptList.add(dept);
                
    }
    update(deptList); 
 
}