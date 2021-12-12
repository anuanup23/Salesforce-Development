public class AccountTriggerHanldler {
    public static void beforeInsert(List<Account> newList, Map<Id, Account> oldMap){
        populateSLAExpirationDate(newList);
	}
    public static void afterInsert(List<Account> newList, Map<Id, Account> oldMap){

	}
	public static void afterUpdate(List<Account> newList, Map<Id, Account> oldMap){

	}
    public static void beforeUpdate(List<Account> newList, Map<Id, Account> oldMap){

	}
    public static void afterDelete(List<Account> newList, Map<Id, Account> oldMap){

	}
    public static void afterUndelte(List<Account> newList, Map<Id, Account> oldMap){

	}
    public static void populateSLAExpirationDate(List<Account> newList){
        for(Account acc : newList){
            acc.SLAExpirationDate__c = Date.today().addDays(180);
        }
    }
}