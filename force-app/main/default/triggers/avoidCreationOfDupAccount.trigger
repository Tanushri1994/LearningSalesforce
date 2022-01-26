trigger avoidCreationOfDupAccount on Account (before insert) {
  //Grab all the account on which you  are trying to insert
  List<String> nameAccount = new List<String>();
    for(Account a: Trigger.new){
        nameAccount.add(a.name);
    }
    
   
    List<String> dupNames = new List<String>();
    
    for(Account acc :[select Id,Name from Account where Name IN :nameAccount]){
        dupNames.add(acc.Name);
    }
    for(Account dup : Trigger.new){
        if(dupNames.contains(dup.Name)){
            dup.addError('Account name already exist in databse :' + dup.Name);
        }
    }
}