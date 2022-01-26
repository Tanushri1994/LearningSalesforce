trigger UpdateCaseOwnerToQueue on Case (before insert) {
    
    
    for(Case c :trigger.new){
        if(c.origin == 'Phone'){
           c.OwnerId  = [SELECT Id, Name FROM Group where name = 'Service Agent Queue'].id;
            

            //As a new Case record is created, with Origin=Phone, update the Case owner as ‘Service Agent Queue’, 
            //and expected_closed_date__c = 2 days after today if its blank. Hint :  c.ownerid = [SELECT Id, Name FROM Group where name = 'Service Agent Queue'].id;
          
          c.Expected_Close_Date__c = system.today() + 2;
            
        }
    }
}