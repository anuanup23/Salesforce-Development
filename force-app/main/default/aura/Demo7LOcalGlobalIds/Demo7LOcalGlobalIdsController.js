({
    handleClick : function(component, event, helper) {
            var cmp = component.find("demo1input");
            console.log('Local ID is '+cmp.getLocalId());
            console.log('Input Value is '+cmp.get('v.value'));
            console.log('Global ID is '+cmp.getGlobalId());
            console.log('Label is '+cmp.get('v.label'));
            cmp.set('v.value',"Test val");
            cmp.set('v.label',"Test label");
    },



    showMultipleId : function(component, event, helper) {

        var cmp = component.find("demo2input"); 
        cmp.forEach(function (item, index) 
        { 
            console.log('Item ---'+index+' Local Id is '+item.getLocalId()) //+''+item.get(
                var myvalue = item.get('v.value'); 
                if (myvalue !==''){
                    item.set('v.readonly', true);
                }
        // console.log('Item ---'+index+' Global Id is '+item.getGlobalId());
        });
    },


    reset: function (component, event, helper){
         var cmp = component.find("demo2input");
        cmp.forEach(function(item, index){
            item.set('v.value','');
            item.set('v.readonly', false);
        });
    }
})