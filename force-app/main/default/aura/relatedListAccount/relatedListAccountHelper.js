({
    doInit : function(component,event) 
    {
        var getData = component.get("c.getAccounts");
        getData.setParams({
            recId:component.get("v.recordId")
        });
        getData.setCallback(this, function(response) {
            var state = response.getState();
            var rstate = response.getReturnValue();
            console.log('State ' + state);
            if(state === "SUCCESS"){
                console.log("Response: ");
                console.log(rstate);
                component.set("v.data", rstate);
            }else if(state === "INCOMPLETE"){
                console.log("Response: ");
                console.log(rstate);
                console.log("Incomplete");
            }else if(state === "ERROR"){
                console.log("Response: ");
                console.log(rstate);
                console.log("error " + response.getError());
            }
        });
        $A.enqueueAction(getData);

    }
})