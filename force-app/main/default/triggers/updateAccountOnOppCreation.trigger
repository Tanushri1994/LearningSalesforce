trigger updateAccountOnOppCreation on Opportunity (after insert,after update) {
    Set<Id> oppAccountId = new Set<Id>();
    for(Opportunity opp : Trigger.new){
        oppAccountId.add(opp.AccountId);
    }
    
    List<Account> accListToUpdate = new List<Account>();
    for(Account acc : [Select Id, (Select Id from Opportunities) from Account where Id IN :oppAccountId])
    {
        List<Opportunity> oppList = acc.Opportunities;
        
        for(Opportunity opty : oppList){
            acc.Opportunity_Last_updated__c =opty.LastModifiedDate;
        }
        acc.Opportunity_Updating_count__c =oppList.size();
        accListToUpdate.add(acc);
    }
    update(accListToUpdate);
}