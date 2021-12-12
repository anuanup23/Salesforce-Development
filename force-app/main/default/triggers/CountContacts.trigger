trigger CountContacts on Contact (after insert,after delete, after undelete) {
    //Set<Id> contactSet = new Set<Id>();
    List<Id> accountSet = new List<Id>();
    Map<Id,Integer> accountToContactCountMap = new Map<Id,Integer>();
    System.debug('>>>>>>>');
    if(Trigger.isAfter && Trigger.isInsert){
        System.debug('>>>>>>> Trigger Called After Insert');
        for(Contact con : Trigger.New){
            //contactSet.add(con.Id);
            accountSet.add(con.AccountId);
        }
        System.debug('>>>>> accountSet.size() ' + accountSet.size());
        for (Account acc : [SELECT Id, No_Of_Contacts__c FROM ACCOUNT WHERE Id IN : accountSet]){
            if(accountToContactCountMap.containsKey(acc.Id)){
                //accountToContactCountMap.put(acc.Id,(Integer)acc.No_Of_Contacts__c);
                if(acc.No_Of_Contacts__c != NULL)
                    acc.No_Of_Contacts__c += 1;
                else{
                    System.debug('NULLUY1');
                    List<Contact> totalContacts = [SELECT Id FROM Contact WHERE accountid =: acc.Id];
                    acc.No_Of_Contacts__c = totalContacts.size();
                    System.debug('>>>>>' +  totalContacts.size() + '  ' + acc.No_Of_Contacts__c);
                }
                accountToContactCountMap.put(acc.Id,(Integer)acc.No_Of_Contacts__c);
            }
            else{
                if(acc.No_Of_Contacts__c != NULL)
                    acc.No_Of_Contacts__c += 1;
                else{
                    System.debug('NULLUY2');
                    List<Contact> totalContacts = [SELECT Id FROM Contact WHERE accountid =: acc.Id];
                    acc.No_Of_Contacts__c = totalContacts.size();
                    System.debug('>>>>>' +  totalContacts.size() + '  ' + acc.No_Of_Contacts__c);
                }
                accountToContactCountMap.put(acc.Id,(Integer)acc.No_Of_Contacts__c);
            }
        }
        List<Account> updateList = new List<Account>();
        for(Id accId : accountToContactCountMap.keySet()){
            Account here = new Account();
            here.Id = accId;
            here.No_Of_Contacts__c = accountToContactCountMap.get(accId);
            System.debug('>>>>> ' + here.Id + '>>>>>' + here.No_Of_Contacts__c);
            updateList.add(here);
        }
        if(updateList.size() > 0){
            System.debug('>>>>>' + 'Performing Update');
            update updateList;
        }   
    }
}