import { LightningElement,track ,wire} from 'lwc';
import LocationList from '@salesforce/apex/LocationController.getLocationList';

export default class ConcertPage extends LightningElement {

    
@track value;

@track TypeOptions;

@wire(LocationList, {})
fetchAccount({error, data}){
    
    if(data){
        let options = [];
                
            for (var key in data) {
                // Here key will have index of list of records starting from 0,1,2,....
                options.push({ label: data[key].Venue__c, value: data[key].Venue__c  });

                    
            }
            this.TypeOptions = options;
    }else if(error){
        console.log(error);
    }
}

handleChange(event) {
            this.value = event.target.value;
}
}