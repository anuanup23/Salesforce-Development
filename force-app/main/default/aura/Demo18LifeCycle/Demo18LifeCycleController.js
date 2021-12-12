({
    doInit : function(component, event, helper) {
        console.log('Init event get called');
    },
    onRender : function(component, event , helper){
        console.log('Render event get called');
    },
    handleClick : function(component, event, helper){
        console.log('Data updated');
        component.set("v.mydata","Lifecycle Data Updated");
    },
    destroyComponent : function(component, event, helper){
        var cmp = component.find("myid");
        cmp.destroy();
    }
})