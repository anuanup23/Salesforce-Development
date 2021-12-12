public class AccountUpdateBatch implements Database.Batchable<sObject>, Database.Stateful,Schedulable{
    public Integer countFailed = 0;
    public Integer countPassed = 0;
    public Set<Id> accountIdSet;
    public Set<String> industrySet;
    
    public AccountUpdateBatch(){
        countFailed = 0;
        countPassed = 0;
        accountIdSet = new Set<Id>();
        
    }
    public AccountUpdateBatch(Set <String> tempSet){
        industrySet = new Set<String>();
        industrySet.addAll(tempSet);
    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id, Name FROM Account WHERE Industry =  :industrySet';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Account> accountList ){
        for(Account acc : accountList) 
        acc.Active__c = 'No';
       // update accountList;
       Database.SaveResult[] lsr = Database.update(accountList,false);
      /*Integer count = 0;
        for(Database.SaveResult sr : lsr){
            if(sr.isSuccess()){
                count += 1;
            }
		}
        system.debug('failed records = ' + (accountList.size() - count) + 
                    'Success Records = '+count);*/
        for(Database.SaveResult sr : lsr){
            if(sr.isSuccess()){
                countPassed += 1;
                accountIdSet.add(sr.getId());
            }
            else{
                countFailed += 1;
            }
        }
    }
    public void finish(Database.BatchableContext bc){
        List<Account> failedList = [SELECT Id, Name
                                   FROM Account
                                   WHERE Id NOT IN : accountIdSet];
        system.debug('>>>>>' + failedList.size()+ '>>>>>' + failedList);
        system.debug('failed Records = ' + countFailed + ' Success Records = ' + countPassed);
    }
    public void execute(SchedulableContext sc){
        AccountUpdateBatch temp = new AccountUpdateBatch(industrySet);
        Database.executeBatch(temp, 20);
    }
}