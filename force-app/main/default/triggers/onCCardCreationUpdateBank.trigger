trigger onCCardCreationUpdateBank on Credit_Card__c (after insert) {

    List<Id> cId = new List<Id>();
    List<Bank__c> bankList = new List<Bank__c>();
    public decimal final_total=0;
    
    for(Credit_Card__c c: Trigger.new){
         cId.add(c.Bank__c);
    }
    
    for(Bank__c bank : [Select Id,Name,(Select Id,Balance__c from Credit_Cards__r),Count_of_Credit_Cards__c,Sum_of_Balance__c from Bank__c where Id IN :cId]){
        List<Credit_Card__c> ccList = bank.Credit_Cards__r;
        bank.Count_of_Credit_Cards__c = ccList.size();
        for(Credit_Card__c total : ccList ){
             final_total = final_total + total.Balance__c;
        }
        bank.Sum_of_Balance__c = final_total;
        bankList.add(bank);
    }
    
    update(bankList);
}