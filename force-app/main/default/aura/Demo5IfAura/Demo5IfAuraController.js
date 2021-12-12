({
    handleClick : function(component, event, helper) {
            var boolval = new Boolean(component.get('v.show'));
            alert(boolval);
            component.set('v.show',!boolval);
            if(boolval == true) component.set('v.label', "show True");
            if(boolval == false) component.set('v.label', "show False");
    }
})