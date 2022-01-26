//As a new Case record is created, with Origin=Phone, 
//update the Case owner as ‘Service Agent Queue’,
// and expected_closed_date__c = 2 days after today if its blank.   
trigger updateCaseOwner on Case (before insert) {
    
    for(Case c : Trigger.new){
        if(c.Origin == 'Phone'){
            c.ownerid = [SELECT Id, Name FROM Group where name = 'Service Agent Queue'].id;
            if( c.Expected_Close_Date__c == null){
                c.Expected_Close_Date__c=system.Today()+2;
            }
            
        }
    }
}