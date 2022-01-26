import { LightningElement, wire } from 'lwc';
import accounts from '@salesforce/apex/AccountController.getAccounts';

export default class WireAsFunctionExample extends LightningElement {
    lstAccount = [];
    strSearchText;

     
    @wire (accounts, {strName:'$strSearchText'})
    fetchAccount({error, data}){
        if(data){
            this.lstAccount = data; 
        }else if(error){
            console.log(error);
        }
    };


    changeSearchText(event){
        this.strSearchText = event.target.value;
    }

}