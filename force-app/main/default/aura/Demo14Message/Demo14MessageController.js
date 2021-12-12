({
    showMessage : function(component, event, helper) {
        helper.messageUtility(component,event,'Success','green');
    },
    showErrorMessage : function(component, event, helper) {
        helper.messageUtility(component,event,'ERROR','red');
    },
    removeMessage : function(component, event, helper) {
        helper.removeMessageutility(component);
    },
})