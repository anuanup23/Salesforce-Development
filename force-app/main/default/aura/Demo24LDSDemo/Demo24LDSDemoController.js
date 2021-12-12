({
    doInit : function(component, event, helper) {
        component.find("contactRecord").getNewRecord(
            "Contact",
            null,
            false,
            $A.getCallback(function(){
                var error = component.get("v.newContactError");
                if(error) console.log("error "+error);
                console.log(JSON.stringify(component.get("v.newContact")));
                console.log(JSON.stringify(component.get("v.simpleNewContact")));
                console.log(JSON.stringify(component.get("v.simpleAccount")));
            })
        );
    },
    handleSave :function(component, event, helper) {
        component.set("v.simpleNewContact.AccountId",component.get("v.recordId"));
        component.find("contactRecord").saveRecord(function(response){
            if(response.state === "SUCCESS" || response.state === "DRAFT"){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title" : "Contact Saved",
                    "message" : "The Record has Been Updated succesfully"
                });
                var dismissActionPanel = $A.get("e.force:closeQuickAction");
                dismissActionPanel.fire();
                toastEvent.fire();
                $A.get('e.force:refreshView').fire();
            }else{
                alert("error");
            }
        });
    },
    handelCancel : function(Component,event, helper){
        var dismissActionPanel = $A.get("E.force:closeQuickActon");
        dismissActionPanel.fire();
    }
})