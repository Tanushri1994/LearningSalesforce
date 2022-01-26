//	Avoid deletion of Child Past Information record if Parent’s Type= Employee and Parent’s Status = Approved
trigger avoidDeletionPI on Past_Information__c (before delete) {
//List<Consultant__C> conID = [SELECT Id, Name, Type__c, Status__c FROM Consultant__c where Type__c='Employee' and Status__c='Approved' ];
 List<ID> piId = new List<ID>();
    for(Past_Information__c pi : Trigger.old){
         piId.add(pi.Consultant__c);      
    }
    
        List<Id> conList = new List<Id>();
    
 for(Consultant__c con : [SELECT Id, Name, Type__c, Status__c FROM Consultant__c where Type__c='Employee' and Status__c='Approved' and ID IN:piId] )
    {
     conList.add(con.id);    
    }    
    
    for(Past_Information__c pi : Trigger.old){
        if(conList.contains(pi.Consultant__c) )  {
            pi.addError('You cannot delete approved employee');
        }
    }
    
}