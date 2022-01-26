//Write a trigger on contact to prevent duplicate records based on Contact Email & Contact Phone.
trigger avoidDuplicateContact on Contact (before insert) {
 
  Map<String, String> dupSearchMap = new Map<String, String>();  
    for(Contact con : Trigger.New){
        dupSearchMap.put(con.Phone, con.Email);        
    }
    
    Map<String, String> dup = new Map<String, String>();  
    for(Contact contact : [Select email,Phone from Contact where phone IN :dupSearchMap.keySet()])
    {
        dup.put(contact.Phone, contact.Email);
    }
    
    for(Contact dupcon : Trigger.New){
        if(dup.containsKey(dupcon.Phone)){
            dupcon.addError('latest:Phone already exist');
        }    
    }
}