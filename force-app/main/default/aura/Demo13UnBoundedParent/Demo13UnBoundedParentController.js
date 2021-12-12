({
    updateParentAttr: function(component, event, helper) {
        component.set('v.parentAttribute', 'Updated UnBounded Parent Attribute Value');
    },
    changeParentAttribute: function (component, event, helper) {
        console.log('========UnBounded Parent Component Logs=====');
        console.log('UnBounded Parent Attribute Is updated');
        console.log('UnBounded Parent Attribute Old Value '+event.getParam('oldValue'));
        console.log('UnBounded Parent Attribute New Value' +event.getParam('value'));
    }
})