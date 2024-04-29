trigger MasterLeadTrigger on Lead (before insert, after insert,before update, after update,before delete, after delete) {
  if (Trigger.isBefore) {
    if (Trigger.isInsert) {
      // Call class logic here!
    } 
    if (Trigger.isUpdate) {
      // Call class logic here!
      // First create an instance of the class object
      IndustryChangeTriggerClass handler = new IndustryChangeTriggerClass();
      //then call the method using the class object created
      handler.doIndustryChange(Trigger.new);
    }
    if (Trigger.isDelete) {
      // Call class logic here!
    }
  }
  if (Trigger.isAfter) {
    if (Trigger.isInsert) {
      // Call class logic here!
    } 
    if (Trigger.isUpdate) {
      // Call class logic here!
    }
    if (Trigger.isDelete) {
      // Call class logic here!
    }
  }

}