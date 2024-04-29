trigger MaintenanceRequest on Case (before update, after update) {
    // ToDo: Call MaintenanceRequestHelper.updateWorkOrders
    if(Trigger.IsBefore){
        if(Trigger.IsUpdate){
            //MaintenanceRequestHelper.updateWorkOrders();
        }
    }
    if(Trigger.IsAfter){
        if(Trigger.IsUpdate){
			MaintenanceRequestHelper.updateWorkOrders(Trigger.New);
        }
    }
}