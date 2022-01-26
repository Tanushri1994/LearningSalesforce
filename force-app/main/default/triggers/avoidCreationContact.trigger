//Avoid creation of Contact record, if a consultant record who is an Employee ( type=employee ) 
//with same email is existing in the org, 
//show an error message “You cannot create a contact record of an employee. Please contact your system administrator.”- (20 marks)

trigger avoidCreationContact on Contact (before insert) {
    List<ID> conId = new List<ID>();
    List<String> contEmail = new List<String>();   
    //Bring all consultant id from Contacts object
    for(Contact cid : Trigger.New){
        conId.add(cid.Consultant__c); 
        contEmail.add(cid.Email);
    }
    
    List<Id> consultantList = new List<Id>();
    for(Consultant__c consultant : [SELECT Id, Name, Type__c,Email__c FROM Consultant__c where Type__c='Employee' and Id IN :conId])                                    
    {
        consultantList.add(consultant.Id);
    }
    
    for(Contact c : Trigger.New){
        if(consultantList.contains(c.Consultant__c) && contEmail.contains(c.Email))  {
            c.addError('You cannot create a contact record of an employee. Please contact your system administrator');
        }
    }
    
}