@isTest
public class ApexScenario1Test {
	@isTest
    static void testUpdateActiveFieldUsingMap(){
    Account acc = new Account();
    acc.Name = 'Test Class Demo';
    insert acc;
    Contact con = new Contact();
    con.LastName = 'Test1';
    con.FirstName = 'Demo';
    con.AccountId = acc.Id;
    insert con;
    ApexScenario1.updateActiveFieldUsingMap();
    for(Account temp : [SELECT Id, Active__c FROM account 
                        WHERE Id = :acc.Id]){
                            System.assertEquals('Yes', temp.Active__c);
						}
    }
}