//Write a trigger, only system admin user should be able to delete the task.

trigger deleteTask on Task (before delete) {
    
    
    Id profileid=Userinfo.getProfileId();  
    profile profilname=[select Name from Profile where id=:profileid];
    
    for(Task accountDuplicate:Trigger.old){
        if(profilname.Name!='System Administrator'){
            accountDuplicate.addError('No Access for Deletion');                                    
        }
        
    }
    
}