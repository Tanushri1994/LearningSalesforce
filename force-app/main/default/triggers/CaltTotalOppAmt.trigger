//Upon Account update, field 'Total Opportunity Amount' will update with the total amount from 
//All Opportunities on Account level.

trigger CaltTotalOppAmt on Account (before update) {
    List<Account> accList = new List<Account>();
    Set<Id> accIdList = new Set<Id>();
    
    for(Account acc: Trigger.new){
        accIdList.add(acc.Id);
    }
	Map<Id,List<Opportunity>> accmap = new Map<Id,List<Opportunity>>();
    for(Account acc : [Select Id,Name,(Select accountId, Amount from Opportunities) from Account where Id IN : accIdList]){
        accmap.put(acc.Id, acc.Opportunities);
        System.debug('accmap is populated');
           System.debug('account Id'+acc.Id +' '+'with associated Opportunities'+acc.Opportunities);
    }
     
    for(Account acc : Trigger.new){
        if(accmap.containsKey(acc.Id) && accmap.get(acc.Id) != null){
            for(Opportunity opp : accmap.get(acc.Id)){
                if(opp.Amount == NULL){
                    opp.Amount = 0;
                }
                acc.Total_Opportunity_Amount__c += opp.Amount;
            }
        }
        
    } 
}