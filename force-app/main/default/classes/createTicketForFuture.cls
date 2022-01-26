public class createTicketForFuture {
    @auraEnabled
    public static Boolean handleTicketStatus(String ticketId){
        System.debug(ticketId);
        Ticket__c ticket = [Select Id, Concert__r.Status__c ,Name FROM Ticket__c Where Id =: ticketId limit 1];
		//Concert__c concert = [Select Id,Status__c, (Select Id from Ticket__c) from Concert__r where Id =:ticketId limit 1];
        if(ticket.Concert__r.Status__c == 'Past Concert'){
             return true;
        }
        return false;
    }
}