import { LightningElement } from 'lwc';

export default class Lesson1 extends LightningElement {
firstNumber = 0;
SecondNumber = 0;
result=0;

handleClick(event){
  
if(event.target.label == 'Addition'){
this.result =  this.firstNumber +  this.SecondNumber;
alert(result);
}
else if(event.target.label == 'Minus'){
    this.result =  this.firstNumber -  this.SecondNumber;
    alert(result);
}
else{
    this.result =  this.firstNumber *  this.SecondNumber;
    alert(result);
}

}

captureInput(event){
    if(event.target.name =='input1'){
        this.firstNumber = parseInt(event.target.value);
         
    }
    if(event.target.name =='input2'){
        this.SecondNumber = parseInt(event.target.value);
         
    }
}
}