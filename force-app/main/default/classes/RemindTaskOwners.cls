global class RemindTaskOwners implements Schedulable  {
    
    
    global void execute(SchedulableContext ctx) { 
        List<Task_Assigned__c> tasks = [SELECT Id, Name, Status__c FROM Task_Assigned__c
                                        WHERE Status__c = 'InProgress'] ; 
        for(Task_Assigned__c t : tasks){
            EmailManager.sendMail('tanu26pazare@gmail.com', 
                                  'Hey!! I learned a schedulable apex',
                                  ' Task is in progress');  
        }
    }
}