({
    updateParentAttr: function(component, event, helper) {
        component.set('v.parentAttribute', 'Updated Bounded Parent Attribute Value');
    },    
    changeParentAttribute: function (component, event, helper) {    
        console.log('========Bounded Parent Component Logs=====');    
        console.log('Bounded Parent Attribute Is updated');        
        console.log('Bounded Parent Attribute Old Value '+event.getParam('oldValue'));    
        console.log('Bounded Parent Attribute New Value' +event.getParam('value'));    
    }
})