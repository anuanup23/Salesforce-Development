public class ApexDatabaseDemo {
    public static void insertSingleAccount(){
        Account acc = new Account();
        acc.Name = 'Test From Apex';
        acc.Active__c = 'Yes';
        acc.Industry = 'Technology';
        insert acc;
        System.debug('>>>>>>' + acc.Id);
    }
    /*public static void createMultipleAccountsRecords(){
        for(Integer count = 220; count < 400; count++){
            Account acc = new Account();
            acc.Name = 'Test From Apex';
            acc.Active__c = 'Yes';
            acc.Industry = 'Technology';
            insert acc;
            System.debug('>>>>>>' + acc.Id);
		}
	}*/
    public static void createMultipleAccountRecords(){
        List<Account> accountList = new List<Account>();
        for(Integer count = 220; count < 400; count++){
            Account acc = new Account();
            acc.Name = 'Test From Apex' + count;
            acc.Active__c = 'Yes';
            acc.Industry = 'Technology';
            accountList.add(acc);
		}
        if(accountList.size() > 0){
            insert accountList;
        }
        for(Account acc : accountList){
        	System.debug('>>>>>>Account Name is ' +acc.Name+' and Account Id is '+acc.Id);
        }
    }
    public static void updateMultipleRecords(){
        List<Account> accountList = new List<Account>();
        accountList = [SELECT Id, Name, Active__c,Industry,Rating,CreatedDate,
                      CreatedById,LastModifiedDate,LastModifiedById
                      FROM Account
                      WHERE Name LIKE 'Test From Apex%'
                      OR Industry = 'Technology'
                      ORDER BY Name];
        for(Account acc : accountList){
            acc.Active__c = 'Yes';
        }
        if(accountList.size() > 0){
            update accountList;
        }
    }
    
    
    
    public static void deleteMultipleRecords(){
        List<Account> accountList = new List<Account>();
        accountList = [SELECT Id
                      FROM Account
                      WHERE Name LIKE 'Test From Apex%'
                      ];
        if(accountList.size() > 0){
            delete accountList;
        }
    }
}