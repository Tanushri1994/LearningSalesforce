import { LightningElement ,api,track,wire} from 'lwc';
import getConcertListByLocation from '@salesforce/apex/LocationController.getConcertListByLocation';
import { NavigationMixin } from 'lightning/navigation'; 
export default class GrabConcertsByLocation extends NavigationMixin(LightningElement) {
    @api selectedlocation;
    @track recordPageUrl;
    @api recordId;
    @track columns = [{
    label: 'Concert name',
    fieldName: 'Name',
    type: 'text',
    sortable: true
},
{
    label: 'Venue',
    fieldName: 'Venue__c',
    type: 'text',
    sortable: true
},
{
    label: 'Date',
    fieldName: 'Date_of_concert__c',
    type: 'Date',
    sortable: true
},
{
    label: 'Tickets Available',
    fieldName: 'Tickets_Available__c',
    type: 'Number',
    sortable: true
},
{
    label: 'Tickets Remaining',
    fieldName: 'Tickets_Remaining__c',
    type: 'Number',
    sortable: true
}
    
];

@track error;
@track concertList ;
 

@wire(getConcertListByLocation, {location:'$selectedlocation'})
wiredConcerts({error,data}) {
    if (data) {
        this.concertList = data;
    } else if (error) {
        this.error = error;
    }
}

navigateToConcertRecordPage(event){
    alert('Record Id ==> '+ event.target.value);
    this[NavigationMixin.Navigate]({
        type:'standard__recordPage',
        attributes:{
            "recordId":event.target.value,
            "objectApiName":"Concert__c",
            "actionName": "view"
        }
    });
}

}