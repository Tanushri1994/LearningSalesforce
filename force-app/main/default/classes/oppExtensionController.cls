public class oppExtensionController {
    
    public List<Opportunity> oppList{get;set;} 
    public oppExtensionController(ApexPages.StandardController controller) {
        
        oppList = [SELECT Name, ExpectedRevenue, LeadSource, CloseDate
                   FROM Opportunity order by ExpectedRevenue];
        
    }   
}