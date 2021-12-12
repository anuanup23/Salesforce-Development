({
    messageUtility : function(component,event,title,cssclass) {
        var msg = event.getParam('arguments').message;
        var msgDiv = component.find("messagediv");
        $A.createComponents([[
            "lightning:card" ,{
                "title" :title ,
                "class" : cssclass
            }],
            [
                "lightning:formattedText",{ "value" : msg }
            ]],
            function(components,status){
                if(status === 'SUCCESS'){
                    var lccard = components[0];
                    var formatedtext = components[1];
                    lccard.set("v.body",formatedtext);
                    msgDiv.set("v.body",lccard);
                }
            });
    },
    removeMessageutility : function(component){
        var msgDiv = component.find("messagediv");
        msgDiv.set("v.body",[]);
    }
})