//Create a Child Past Information record with Company ‘TCS’ when a new consultant record 
//of Type=Employee is created
    
trigger createChildPI on Consultant__c (after insert) {
    List<Past_Information__c> piList = new List<Past_Information__c>();
    for(Consultant__c con: Trigger.new){
        if(con.type__c == 'Employee'){
            Past_Information__c pi = new Past_Information__c();
            pi.Consultant__c=con.id;
            pi.Company__c ='TCS';
            
            piList.add(pi);
        }
    }
    if(piList.size()>0){
        insert piList;
    }
    
}