({
    
updateChildAttr: function(component, event, helper) {

    component.set('v.childAttribute', 'Updated Child Attribute Value');
},
    changeChildAttribute: function(component, event, helper) {
         console.log('========child Component Logs========');
    
    console.log('Child Attribute Is updated');
    
    console.log('Child Attribute Old Value '+event.getParam('oldValue'));
    
    console.log('Child Attribute New Value '+event.getParam("value"));
    }
})