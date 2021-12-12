@isTest
public class StudentTriggerHandlerTest {
    @isTest
    public static void testCountOnCreate(){
    	List<College__c> collegeList = new List<College__c>();
        
       /* College__c clg = new College__c();
        clg.Active__c = true;
        clg.State__c = 'Rajasthan';
        clg.Name = 'Test';
        collegeList.add(clg);
       
        College__c clg2 = new College__c();
        clg2.Active__c = true;
        clg2.State__c = 'Rajasthan';
        clg2.Name = 'Test2';
        collegeList.add(clg2);*/
        collegeList = TestDataFactory.createCollegeList('DemoCollege', 'Rajasthan', 5, false);
        if(collegeList.size() > 0) insert collegeList;
       
        
        List<Student__c> studentList = new List<Student__c>();
        College__c check = new College__c();
         /*   
        Student__c student1 = new Student__c();
        student1.Name = 'Test1';
        student1.State__c = 'Rajasthan';
        student1.city__c = 'Jaipur';
        student1.College_Name__c = clg.Id;
        Student1.Student_Email__c = student1.Name + '@gmail.com';
        studentList.add(student1);
        
        
        
        
        
        
        Student__c student2 = new Student__c();
        student2.Name = 'Test2';
        student2.State__c = 'Rajasthan';
        student2.city__c = 'Jaipur';
        student2.College_Name__c = clg2.Id;
        Student2.Student_Email__c = student2.Name + '@gmail.com';
        studentList.add(student2);
            
        Student__c student3 = new Student__c();
        student3.Name = 'Test3';
        student3.State__c = 'Rajasthan';
        student3.city__c = 'Jaipur';
        student3.College_Name__c = clg2.Id;
        Student3.Student_Email__c = student3.Name + '@gmail.com';
        studentList.add(student3);*/
        
        for(college__c col : collegeList){
            studentList.addAll(TestDataFactory.createStudentList('DemoStudent' + col.Name, 'Rajasthan', 'Jaipur', col.Id, 10, false));
        }
        insert studentList;
        
        for(College__c col : [SELECT Id, Student_Count__c
                             FROM College__c
                             WHERE Id = :collegeList.get(0).Id]){
							 check = col;                                  
		}
        
        System.assertEquals(10, check.Student_Count__c);
        
        for(Student__c std : studentList){
            std.College_Name__c = collegeList.get(0).Id;
        }
        update studentList;
        for(College__c col : [SELECT Id, Student_Count__c
                             FROM College__c
                             WHERE Id = :collegeList.get(0).Id]){
							 check = col;                                  
		}
        System.assertEquals(50, check.Student_Count__c);
    } 
    
    
    @isTest
    public static void testCountOnDelete(){
    	List<College__c> collegeList = new List<College__c>();
        
        collegeList = TestDataFactory.createCollegeList('DemoCollege', 'Rajasthan', 5, false);
        if(collegeList.size() > 0) insert collegeList;
       
        
        List<Student__c> studentList = new List<Student__c>();
        List<Student__c> deleteStudentList = new List<Student__c>();
        College__c check = new College__c();
         
        
        for(college__c col : collegeList){
            studentList.addAll(TestDataFactory.createStudentList('DemoStudent' + col.Name, 'Rajasthan', 'Jaipur', col.Id, 10, false));
        }
        insert studentList;
        
        for(student__c std : studentList){
            if(std.college_Name__c == collegeList.get(0).Id) 
                deleteStudentList.add(std);
        }
        delete deleteStudentList;
        
        for(College__c col : [SELECT Id, Student_Count__c
                             FROM College__c
                             WHERE Id = :collegeList.get(0).Id]){
							 check = col;                                  
		}
        System.assertEquals(0, check.Student_Count__c);
    } 
    
    
    
     @isTest
    public static void testCountOnUnDelete(){
    	List<College__c> collegeList = new List<College__c>();
        collegeList = TestDataFactory.createCollegeList('DemoCollege', 'Rajasthan', 5, false);
        insert collegeList;        
        List<Student__c> studentList = new List<Student__c>();
        List<Student__c> deleteStudentList = new List<Student__c>();
        College__c check = new College__c();        
        for(college__c col : collegeList){
            studentList.addAll(TestDataFactory.createStudentList('DemoStudent' + col.Name, 'Rajasthan', 'Jaipur', col.Id, 10, false));
        }
        insert studentList;
        for(student__c std : studentList){
            if(std.college_Name__c == collegeList.get(0).Id) 
                deleteStudentList.add(std);
        }
        delete deleteStudentList;
        List<Student__c> unDeletestudentList = new List<Student__c>();
        unDeletestudentList = [SELECT Id FROM Student__c
                              WHERE isDeleted = true
                              AND Id IN : deleteStudentList
                              ALL ROWS];
        undelete unDeleteStudentList;
        for(College__c col : [SELECT Id, Student_Count__c
                             FROM College__c
                             WHERE Id = :collegeList.get(0).Id]){
							 check = col;                                  
		}
        //System.assert(false, unDeleteStudentList.size());
        System.assertEquals(10, check.Student_Count__c);
    } 
}