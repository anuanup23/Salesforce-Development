public with sharing class LWCDemo24Controller {
    @AuraEnabled(cacheable=true)
   public static List<Account> getAccountList(){
       return [SELECT Id,Name,Active__c FROM Account WHERE Industry='Technology'];
   }
 
   @AuraEnabled
   public static void updateAccountList(){
       List<Account> accList= [SELECT Id,Name,Active__c FROM Account WHERE Industry='Technology'];
       for(Account acc : accList){
           acc.Active__c = 'Yes';
       }
       update accList;
   }

}