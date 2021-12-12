public class ApexScenario3 {
	
    public static void createMapofAccountToContacts1(){
        Map<Id,List<Contact>> accountIdToCOntactMap = new Map<Id,List<Contact>>();
         for(Contact con : [Select Id,Name,AccountId
                          FROM Contact
                          WHERE AccountId != NULL]){
                              if(!accountIdToCOntactMap.containsKey(con.AccountId)){
                                  accountIdToCOntactMap.put(con.AccountId,new List<Contact>());
                              }
                              accountIdToContactMap.get(con.AccountId).add(con);
                        
                           }
        for(Id accountId : accountIdtoContactMap.keySet()){
            System.debug('>>> Account Id >>> '+accountId+' >>>contacts >>> '+accountIdToContactMap.get(accountId));
		}
    }
}