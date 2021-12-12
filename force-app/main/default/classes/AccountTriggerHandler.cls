public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> newList, Map<Id, Account> oldMap){
        //populateSLAExpirationDate(newList);
        populateColor(newList,oldMap);
        copyBillingtoShipping(newList,oldMap);
        addUserToPublicGroup(newList);
    }
    public static void afterInsert(List<Account> newList, Map<Id, Account> oldMap){
        if(StaticConstants.runAccountTrigger) 
        	populateSLAExpirationDateAT(newList,oldMap);
         //addUserToPublicGroup(newList);
    }
    public static void afterUpdate(List<Account> newList, Map<Id, Account> oldMap){
        if(StaticConstants.runAccountTrigger)
        populateSLAExpirationDateAT(newList,oldMap);
    }
    public static void beforeUpdate(List<Account> newList, Map<Id, Account> oldMap){
        //populateColoronUpdate(newList,oldMap);
        populateColor(newList,oldMap);
        copyBillingtoShipping(newList,oldMap);
    }
    public static void beforeDelete(List<Account> newList, Map<Id, Account> oldMap){
        
    }
    public static void afterDelete(List<Account> newList, Map<Id, Account> oldMap){
        
    }
    public static void afterUnDelete(List<Account> newList, Map<Id, Account> oldMap){
        
    }
    public static void populateSLAExpirationDate(List<Account> newList){
        for(Account acc : newList){
            acc.SLAExpirationDate__c = Date.today().addDays(180);
        }
    }
    public static void populateColor(List<Account> newList, Map<Id,Account> oldMap){
        Set<Id> ownerIdset = new Set<Id>();
        for(Account acc : newList){
            if(oldMap == NULL || (acc.OwnerId != oldMap.get(acc.Id).OwnerId)){
                ownerIdSet.add(acc.OwnerId);
            }
        }
        if(OwnerIdSet.size() > 0){
            Map<Id,String> ownerIdtoColorMap = new Map<Id,String>();
            for(User usr : [SELECT Id,Favourite_Color__c
                            FROM User 
                            WHERE Id IN : ownerIdset]){
                                ownerIdtoColorMap.put(usr.Id,usr.Favourite_Color__c);
                            }
            for(Account acc : newList){
                acc.Favourite_Color__c = ownerIdtoColorMap.get(acc.OwnerId);
            }
        }
    }
    public static void populateColoronUpdate(List <Account> newList, Map<Id,Account> oldMap){
        Set<Id> ownerIdset = new Set<Id>();
        for(Account acc : newList){
            if(acc.OwnerId != oldMap.get(acc.Id).OwnerId){
                ownerIdSet.add(acc.OwnerId);
            }
        }
        if(ownerIdSet.size() > 0){
            Map<Id,String> ownerIdtoColorMap = new Map<Id,String>();
            for(User usr : [SELECT Id,Favourite_Color__c
                            FROM User 
                            WHERE Id IN : ownerIdset]){
                                ownerIdtoColorMap.put(usr.Id,usr.Favourite_Color__c);
                            }
            for(Account acc : newList){
                acc.Favourite_Color__c = ownerIdtoColorMap.get(acc.OwnerId);
            }
        }
    }
    public static void addUserToPublicGroup(List<Account> newList){
        Set<Id> ownerIdSet = new Set<Id>();
        for(Account acc : newList){
            ownerIdSet.add(acc.OwnerId);
		}
        addUserToGroup(ownerIdSet);
    }
    @future
    public static void addUserToGroup(Set<Id> ownerSet){
        List<GroupMember> memberList = new List<GroupMember>();
        String a ='New Apex Group';
		List<Group> PGList= new List<Group>();
		PGList=[SELECT Id FROM Group WHERE Type = 'Regular' AND Name=:a];
        for(Id userId : ownerSet){
            GroupMember member = new GroupMember();
            member.GroupId = PGList.get(0).Id;
            member.UserOrGroupId = userId;
            memberList.add(member);
        }
        System.debug('>>>>>' + memberList.size());
        insert memberList;
    }
    public static void populateSLAExpirationDateAT(List<Account> newList, Map<Id,Account> oldMap){
        List<Account> tempAccountList = new List <Account>();
        for(Account acc : newList){
            Account temp = new Account();
            temp.Id = acc.Id;
            temp.SLAExpirationDate__c = Date.today().addDays(180);
            tempAccountList.add(temp);
		}
        if(tempAccountList.size() > 0){
			StaticConstants.runAccountTrigger = false;
            update tempAccountList;
        }
    }
    public static void copyBillingtoShipping(List<Account> newList, Map<Id, Account> oldMap){
        for(Account acc : newList){
            Boolean checkBoxUpdated = false;
            Boolean billingAddressUpdated = false;
            Boolean shippingAddressUpdated = false;
            if(oldMap != null){
             checkBoxUpdated = acc.Copy_Billing_To_Shipping__c != oldMap.get(acc.Id).Copy_Billing_To_Shipping__c;
             billingAddressUpdated = ( acc.BillingStreet != oldMap.get(acc.Id).BillingStreet
                                             || acc.BillingCity != oldMap.get(acc.Id).BillingCity
                                             || acc.BillingState != oldMap.get(acc.Id).BillingState
                                             || acc.BillingPostalCode != oldMap.get(acc.Id).BillingPostalCode
                                             || acc.BillingCountry != oldMap.get(acc.Id).BillingCountry);
             shippingAddressUpdated = ( acc.ShippingStreet != oldMap.get(acc.Id).ShippingStreet
                                              || acc.ShippingCity != oldMap.get(acc.Id).ShippingCity
                                              || acc.ShippingState != oldMap.get(acc.Id).ShippingState
                                              || acc.ShippingPostalCode != oldMap.get(acc.Id).ShippingPostalCode
                                              || acc.ShippingCountry != oldMap.get(acc.Id).ShippingCountry);
            }
            if(oldMap == null || checkBoxUpdated || billingAddressUpdated){
                if(acc.Copy_Billing_To_Shipping__c){
                    if(shippingAddressUpdated){
                        acc.addError('you are not allowed to update shipping address if CB is true');
                    }
                    else{
                        acc.ShippingStreet = acc.BillingStreet;
                        acc.ShippingCity = acc.BillingCity;
                        acc.ShippingState = acc.BillingState;
                        acc.ShippingPostalCode = acc.BillingPostalCode;
                        acc.ShippingCountry = acc.BillingCountry;
                    }
                }
            }
        }
    }
}