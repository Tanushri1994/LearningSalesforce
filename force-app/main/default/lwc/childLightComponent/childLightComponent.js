import { LightningElement } from 'lwc';

export default class ChildLightComponent extends LightningElement {
    handleChange(event){
    event.preventDefault();
    const data = event.target.value;
    
    const customEvent = new CustomEvent('cevent',{detail:data});
    this.dispatchEvent(customEvent);
}

}