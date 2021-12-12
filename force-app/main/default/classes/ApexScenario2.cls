public class ApexScenario2 {
	
    public static void createMapofAccountToContacts(){
        Map<Id,List<Contact>> accountIdToContactMap = new Map<Id,List<Contact>>();
        for(Account acc : [SELECT Id, (SELECT Id, Name FROM Contacts)
                           FROM Account]){
                               accountIdToContactMap.put(acc.Id,acc.Contacts);
		}
        for(Id accountId : accountIdtoContactMap.keySet()){
            System.debug('>>> Account Id >>> '+accountId+' >>>contacts >>> '+accountIdToContactMap.get(accountId));
		}
	}
    
    public static void createMapofAccountToContacts1(){
        Map<Id,List<Contact>> accountIdToContactMap = new Map<Id,List<Contact>>();
        for(Account acc : [SELECT Id 
                           FROM Account]){
                               accountIdToContactMap.put(acc.Id,new List<Contact>());
		}
        
        for(Contact con : [Select Id,Name,AccountId
                          FROM Contact
                          WHERE AccountId IN :accountIdToContactMap.keySet()
                          AND AccountId != NULL]){
                               accountIdToContactMap.get(con.AccountId).add(con);
                           }
        for(Id accountId : accountIdtoContactMap.keySet()){
            System.debug('>>> Account Id >>> '+accountId+' >>>contacts >>> '+accountIdToContactMap.get(accountId));
		}
	}
}