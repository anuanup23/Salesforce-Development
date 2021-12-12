public class SetDemo {
    public setDemo(){
        Set<String> colorSet = new Set<String>();
        colorSet.add('Green');
        colorSet.add('Black');
        colorSet.add('Yellow');
        System.debug('>>> Set Size is '+colorSet.size());
        colorSet.add('Black');
        colorSet.add('Yellow');
        System.debug('>>> Set Size after adding duplicates is '+colorSet.size());
        colorSet.add('BLACK');
        colorSet.add('YELLOW');
        System.debug('>>> Set Size after adding same values in different case is '+colorSet.size());
		System.debug('Do set contains value Green' +colorSet.contains('Green'));
        System.debug('Do set contains value Red' +colorSet.contains('Red'));
        for(String color : colorSet){
            System.debug('>>>'+color);
        }
        Set<String> tempColorSet = new Set<String>();
        tempColorSet.add('Red');
        tempColorSet.add('Black');
        colorSet.addAll(tempColorSet);
        System.debug('>>> Set Size after adding tempColorSet is '+colorSet.size());
        colorSet.clear();
        System.debug('>>> Set Size is '+colorSet.size());
    }
    public static void preventSetOfObjects(){
        Account account1 = new Account();
        account1.Name = 'Test';
        insert account1;
        System.debug('>>>Account' +account1);
        Set<Account> accountSet = new Set<Account>();
        accountSet.add(account1);
        System.debug('>>>Account Set '+accountSet+ '@@@@Size'+accountSet.size());
        Account account3 = new Account();
        account3.Id = account1.Id;
        account3.Name = 'Test 1';
        account3.Active__c = 'Yes';
        update account3;
        System.debug(accountSet.contains(account3));
    }
}