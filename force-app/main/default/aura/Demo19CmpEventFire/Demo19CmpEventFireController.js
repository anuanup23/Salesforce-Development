({
    fireEvent : function(component, event, helper) {
        var cmpeve = component.getEvent("cmpEvent");
        var msg = component.get("v.messageString");
        cmpeve.setParams({
            message : msg
        });
        cmpeve.fire();
    }
})