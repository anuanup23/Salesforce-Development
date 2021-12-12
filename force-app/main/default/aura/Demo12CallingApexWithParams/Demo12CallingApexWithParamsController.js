({
    doInit : function(component, event, helper) {
        var action = component.get("c.getAccounts");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                component.set('v.accountList', response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchContacts : function(component, event , helper){
        var action = component.get("c.getContacts");
        var accId = component.get("v.selectedAccountId");
        action.setParams({accountId : accId});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                component.set('v.contactList', response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
});