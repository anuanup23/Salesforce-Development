trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete){
    if(Trigger.isInsert && Trigger.isBefore){
        AccountTriggerHandler.beforeInsert(Trigger.new,Trigger.oldMap);
    }
     if(Trigger.isInsert && Trigger.isAfter){
        AccountTriggerHandler.afterInsert(Trigger.new,Trigger.oldMap);
    }
     if(Trigger.isUpdate && Trigger.isBefore){
        AccountTriggerHandler.beforeUpdate(Trigger.new,Trigger.oldMap);
    }
     if(Trigger.isUpdate && Trigger.isAfter){
        AccountTriggerHandler.afterUpdate(Trigger.new,Trigger.oldMap);
    }
     if(Trigger.isDelete && Trigger.isBefore){
        AccountTriggerHandler.beforeDelete(Trigger.new,Trigger.oldMap);
    }
     if(Trigger.isDelete && Trigger.isAfter){
        AccountTriggerHandler.afterDelete(Trigger.new,Trigger.oldMap);
    }
         if(Trigger.isUnDelete && Trigger.isAfter){
        AccountTriggerHandler.afterUnDelete(Trigger.new,Trigger.oldMap);
    }
}