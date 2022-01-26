trigger DeleteChildEmployeeRecords on Department__c (before delete) {
List<ID> deptList = new List<ID>();
    for(Department__c dept : Trigger.old){
        deptList.add(dept.id);
    }
    
   List<Employee__c> empList = [select name,Department__c from Employee__c where Department__c IN :deptList];
    delete empList;
}