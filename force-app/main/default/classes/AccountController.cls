public with sharing class AccountController {
     
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccounts(String strName){
        String strNameLike = '%' +strName +'%';
        return [SELECT Name, AccountNumber FROM Account WHERE Name LIKE :strNameLike];
    }


    @AuraEnabled(cacheable=true)
    public static list<Account> getAccounts(){       
        return [SELECT Name, AccountNumber FROM Account LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }
     
}