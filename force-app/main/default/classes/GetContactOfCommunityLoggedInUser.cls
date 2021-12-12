public class GetContactOfCommunityLoggedInUser {
    @AuraEnabled(cacheable=true)
    Public static List<Contact> getUserContactDetails(){
        Id UserId = UserInfo.getUserId();
        List<User> usr = [SELECT ContactId FROM User where id =:UserId LIMIT 1];
        Id ContactId = usr[0].ContactId;
        return [SELECT Id, FirstName, LastName , Email, Phone, MailingStreet, MailingState, MailingPostalCode, MailingCountry, MailingCity FROM Contact WHERE Id =: ContactId];
    }
}