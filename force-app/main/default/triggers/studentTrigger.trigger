trigger studentTrigger on Student__c (after insert,after update,after delete,after undelete) {
    StudentTriggerHandler.countStudents(Trigger.new,Trigger.old,Trigger.oldMap);
}