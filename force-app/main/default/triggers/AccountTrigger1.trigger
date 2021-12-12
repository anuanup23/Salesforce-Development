trigger AccountTrigger1 on Account (/*after insert*/ before insert) {
    
    /*List<Account> accountList = new List<Account>();
    for(Account acc : Trigger.New){
        Account tempAccount = new Account();
        tempAccount.Id = acc.Id;
        tempAccount.Name = null;
        accountList.add(tempAccount);
    }
    if(accountList.size() > 0){
        update accountList;
    }*/
}