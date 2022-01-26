//This trigger will update parent Account field 'Premium' to true,on creation of Opportunity with
//amount greater than 20000.
trigger updateParentAccountField on Opportunity (after insert) {
    //Grab all the account id of opportunity where amount is greate than 20,000
    Set<Id> oppAccountId = new Set<Id>();
    for(Opportunity opp : Trigger.new){
        if(opp.Amount > 20000){
             oppAccountId.add(opp.AccountId);
        }       
    }
    
    List<Account> accListToUpdate = new List<Account>();
    for(Account acc : [Select Id from Account where Id IN :oppAccountId]){
        acc.Premium__c=true;
        accListToUpdate.add(acc);
    }
    update accListToUpdate;
    
}