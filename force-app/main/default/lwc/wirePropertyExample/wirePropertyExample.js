import { LightningElement ,wire} from 'lwc';
import accounts from '@salesforce/apex/AccountController.getAccounts';

export default class WirePropertyExample extends LightningElement {

    strSearchText;
    @wire (accounts, {strName:'$strSearchText'})
    lstAccount;

    
    changeSearchText(event){
        this.strSearchText = event.target.value;
    }


}