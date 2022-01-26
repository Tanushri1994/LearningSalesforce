({
	handleClick : function(component, event, helper) {
		var firstNumber = parseInt(component.find("fnumber").get("v.value"));
        var secondNumber = parseInt(component.find("snumber").get("v.value"));
        var result = 0;
 
        
        var buttonName = event.getSource().get("v.label");
        if(buttonName == 'Addition'){
          result =   firstNumber+secondNumber;
        }
        else if(buttonName == 'Substraction'){
             result =   firstNumber-secondNumber;
        }
        else if(buttonName == 'Multiplication'){
             result =   firstNumber*secondNumber;
        }
        else if(buttonName == 'Divide'){
             result =   firstNumber/secondNumber;
        }
        component.set("v.myresult",result);
	}
})