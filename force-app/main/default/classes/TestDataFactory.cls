public class TestDataFactory {
    public static List<College__c> createCollegeList(String name, String state, Integer count, Boolean isInsert){
        List<College__c> collegeList = new List<College__c>();
        for(Integer i = 1; i <= count; ++i){
            College__c clg = new College__c();
            clg.Name = name + i;
            clg.State__c = state;
            clg.Active__c = true;
            collegeList.add(clg);
        }
        if(isInsert) insert collegeList;
        return collegeList;
    }
    
    
    public static List<Student__c> createStudentList(String name, String state,String city,String collegeId, Integer count, Boolean isInsert){
        List<Student__c> studentList = new List<Student__c>();
        for(Integer i = 1; i <= count; ++i){
            Student__c std = new Student__c();
            std.Name = name + i;
            std.State__c = state;
            std.City__c = city;
            if(collegeId != NULL && collegeId != '') std.College_Name__c = collegeId;
           	std.Student_Email__c = name + i + '@mtxb2b.com';
            studentList.add(std);
        }
        if(isInsert) insert studentList;
        return studentList;
    }
}