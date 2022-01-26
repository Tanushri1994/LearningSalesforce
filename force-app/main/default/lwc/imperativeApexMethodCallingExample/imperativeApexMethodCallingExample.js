import { LightningElement ,track} from 'lwc';
import getContactList from '@salesforce/apex/AccountController.getContactList';
export default class ImperativeApexMethodCallingExample extends LightningElement {

 @track contacts;
    @track error;

    handleLoad() {
        getContactList()
            .then(result => {
                this.contacts = result;
            })
            .catch(error => {
                this.error = error;
            });
    }
}