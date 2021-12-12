public class StudentTriggerHandler {
	public static void countStudents(List<Student__c> newList,List<Student__c> oldList, Map<Id, Student__c> oldMap){
        Set<Id> collegeIdSet = new Set<Id>();
        //Map<Id,Integer> colledgeIdToStudentCountMap = new Map<Id,Integer>();
        Map<String,Integer> colledgeIdToStudentCountMap = new Map<String,Integer>();
        if(newList != NULL){
            for(student__c student : newList){
                if(oldMap == NULL || student.College_Name__c != oldMap.get(student.Id).college_Name__c){
                    if(student.College_Name__c != NULL){
                        collegeIdSet.add(student.College_Name__c);
                        colledgeIdToStudentCountMap.put(student.College_Name__c,0);
                    }
                    if(oldMap != NULL && oldMap.get(student.Id).College_Name__c != NULL){
                        collegeIdSet.add(oldMap.get(student.Id).College_Name__c);
                        colledgeIdToStudentCountMap.put(oldMap.get(student.Id).College_Name__c,0);
                    }
                }
            }
        }
        else{
            for(Student__c student : oldList){
                collegeIdSet.add(student.College_Name__c);
                colledgeIdToStudentCountMap.put(student.College_Name__c,0);
            }
        }

       /* for(Student__c student : [SELECT Id, Name, College_Name__c
                                 FROM Student__c
                                  WHERE College_Name__c IN: collegeIdSet]){
                                      Integer count = colledgeIdToStudentCountMap.get(student.College_Name__c);
                                      count += 1;
                                      colledgeIdToStudentCountMap.put(student.College_Name__c, count);
                                  }*/
        // inner query
        /*for(College__c college : [SELECT Id, (SELECT Id FROM Students__r)
          						  FROM College__c
                                  WHERE Id IN :collegeIdSet]){
                                     colledgeIdToStudentCountMap.put(college.Id,college.Students__r.size());
                                  }*/
        // aggregate query
        AggregateResult[]  groupedResults = [SELECT College_Name__c, COUNT(Id)
                                             FROM Student__c
                                             WHERE College_Name__c IN :collegeIdSet
                                             GROUP BY College_Name__c];
        for(AggregateResult ar : groupedResults){
            colledgeIdToStudentCountMap.put(String.valueOf(ar.get('College_Name__c')),Integer.valueOf(ar.get('expr0')));
        }
        
        List<College__c> collegeUpdateList = new List<College__c>();
        for(Id collegeId : colledgeIdToStudentCountMap.keySet()){
            College__c college = new College__c();
            College.Id = collegeId;
            college.Student_Count__c = colledgeIdToStudentCountMap.get(collegeId);
            collegeUpdateList.add(college);
        }
        if(collegeUpdateList.size() > 0) update collegeUpdateList;
	}
}