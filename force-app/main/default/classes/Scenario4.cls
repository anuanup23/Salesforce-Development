public class Scenario4 {
    public static void copyAddress(Set<Id> accountIdSet){
        List<Account> accountUpdateList = new List<Account>();
        for(Account acc : [SELECT Id, Name, BillingStreet, BillingCity, BIllingState,
                          BillingPostalCode,BillingCountry,
                          Copy_Billing_To_Shipping__c
                          FROM Account
                          WHERE Copy_Billing_To_Shipping__c = true
                           AND Id IN : accountIdSet]){
                               acc.ShippingStreet = acc.BillingStreet;
                               acc.ShippingCity = acc.BillingCity;
                               acc.ShippingState = acc.BillingState;
                               acc.ShippingPostalCode = acc.BillingPostalCode;
                               acc.ShippingCountry = acc.BillingCountry;
                               accountUpdateList.add(acc);
						}
        if(accountUpdateList.size() > 0){
            update accountUpdateList;
        }
    }
}