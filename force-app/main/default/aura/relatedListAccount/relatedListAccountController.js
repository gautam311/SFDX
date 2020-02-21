({
    myAction : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Account name', fieldName: 'Name', type: 'text'}
        ]);
        helper.doInit(component,helper);
    }
})