trigger avoidCreationOfDupLeadIfContactExist on Lead (before insert) {
//Avoid creation of Lead if Contact with similar email exist in system
//1.Grab all the leads email
 List<String> emailList = new List<String>();
    for(Lead lead : Trigger.new){
        emailList.add(lead.Email);
    }
    
    //2.Fire SOQL query and collect resultset
       
    List<String> dupEmail= new List<String>();
    for(Contact e : [Select Id, Email from Contact where Email IN :emailList] )
    {
        dupEmail.add(e.Email);
    }
    
    for(Lead dupLead : Trigger.new){
        if(dupEmail.contains(dupLead.Email)){
           dupLead.addError('Email already exist for '+dupLead.Name+ 'with'+dupLead.email+' in the system'); 
        }
    }
}