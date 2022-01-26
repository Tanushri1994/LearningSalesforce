trigger CaltTotalOppAmtonAcc on Opportunity (after insert,after update) {
//Upon Account update, field 'Total Opportunity Amount' will update with the total amount from 
//All Opportunities on Account level.
   List<Id> oppIdList = new List<Id>();
   List<Id> oppAccIdList = new List<Id>(); 
    List<Account> accList = new List<Account>();
    for(Opportunity opp : Trigger.new){
        oppIdList.add(opp.Id);
        oppAccIdList.add(opp.AccountId);
    } 
     Map<Id,Decimal> accOppAmountMap = new Map<Id,Decimal>();
    AggregateResult[] aggr = [Select AccountId,SUM(Amount) from Opportunity where AccountId IN:oppAccIdList group by AccountId];
    for(AggregateResult ar : aggr)
    {
    accOppAmountMap.put((Id)ar.get('AccountId'),(Decimal)ar.get('expr0'));        
    }
     
    for(Account acc :[Select Id,Name from Account where Id IN: oppAccIdList]){
        acc.Total_Opportunity_Amount__c = accOppAmountMap.get(acc.Id);
        accList.add(acc);
    }
    update accList;
}