public class GrabOppo {
    @auraEnabled
    public static List<Opportunity> getOppo(){
        List<Opportunity> oppList = [SELECT Id,Name, StageName, Amount FROM Opportunity limit 2];
        return oppList;
    }
}