({
	getMsg : function(component, event, helper) {
		var params = event.getParam('arguments');
         
        if(params){
            var param1 = params.msg1;
            var param2 = params.msg2;
           // alert(param1 + ' '+ param2 );
           param1 = "Hello";
            param2 ="Aura";
            alert(param1 + ' '+ param2 );
        }
	}
})