import { LightningElement , api} from 'lwc';

export default class ParentApiDecoratorExample extends LightningElement {
var1;

getData(event){
this.var1 = event.target.value;
}
}