import { LightningElement, track } from 'lwc';

export default class ParentLightComponent extends LightningElement {
@track msg;

handleCustomEvent(event){
 const var1 = event.detail;   
 
 this.msg=var1;
}
}