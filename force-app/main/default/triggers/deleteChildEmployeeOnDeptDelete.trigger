//Delete employee records if department is deleted.
trigger deleteChildEmployeeOnDeptDelete on Department__c (before delete) {
    //get department id from department object
List<ID> deptId = new List<ID>();
    for(Department__c dept : Trigger.old){
        deptId.add(dept.id);
    }
    
    List<Employee__C> empList =[SELECT Id, Name, Department__c FROM Employee__c where Id IN :deptId];
    delete empList;
}