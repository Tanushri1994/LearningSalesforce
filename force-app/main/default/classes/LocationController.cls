public with sharing class LocationController {
    
@AuraEnabled(cacheable=true)
public static List<Concert__c> getLocationList() {
    return [
        SELECT Id, Venue__c FROM Concert__c
        WITH SECURITY_ENFORCED     
    ];
}

@AuraEnabled(cacheable=true)
public static List<Concert__c> getConcertListByLocation(String location) {
    return [SELECT Id, Name, 
    Date_of_concert__c, Venue__c,
    Tickets_Available__c,
     Tickets_Remaining__c
      FROM Concert__c
      WHERE Venue__c = :location
    WITH SECURITY_ENFORCED ];
}
}
