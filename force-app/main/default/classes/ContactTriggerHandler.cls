public class ContactTriggerHandler {
    public static void preventDuplicates(List<Contact> newList, Map<Id,Contact> oldMap){
        Set<String> fNameSet = new Set<String>();
        Set<String> lNameSet = new Set<String>();
        Set<String> emailSet = new Set<String>();
        Set<String> uniqueKeySet = new Set<String>();
        Set<Date> birthDateSet = new Set<Date>();
        for(Contact con : newList){
            if(oldMap == NULL || (  con.FirstName != oldMap.get(con.Id).FirstName
                                 || con.LastName != oldMap.get(con.Id).LastName
                                 || con.Email != oldMap.get(con.Id).Email
                                 || con.BirthDate != oldMap.get(con.Id).BirthDate)){
                fNameSet.add(con.FirstName);
                lNameSet.add(con.LastName);
                emailSet.add(con.Email);
                birthDateSet.add(con.Birthdate);
            }
        }
        if(fNameSet.size() > 0){
            for(Contact con : [SELECT FirstName,LastName,Email,BirthDate
                              FROM Contact
                              WHERE FirstName IN: fNameSet
                              AND LastName IN : lNameSet
                              AND Email IN : emailSet
                              AND BirthDate IN : birthDateSet]){
                                   String tempKey = con.FirstName + con.LastName + con.Email + String.valueOf(con.Birthdate);
                                    uniqueKeySet.add(tempKey.toUpperCase());
                              }
            for(Contact con : newList){
                String tempKey = con.FirstName + con.LastName + con.Email + String.valueOf(con.Birthdate);
                if(uniqueKeySet.contains(tempKey.toUpperCase())){
                    con.addError('Duplicate Contact');
                }
                else{
                    uniqueKeySet.add(tempKey.toUpperCase());
                }               
            }
		}
    }
}