trigger CollegeTrigger on College__c (after insert) {
	public static void countStudents(List<Student__c> newList){
        Set<Id> collegeIdSet = new Set<Id>();
        for(student__c student : newList){
            if(student.College_Name__c != NULL){
                collegeIdSet.add(student.College_Name__c);
			}
        }
        Map<Id,Integer> colledgeIdToStudentCountMap = new Map<Id,Integer>();
        for(Student__c student : [SELECT Id, Name, College_Name__c
                                 FROM Student__c
                                  WHERE College_Name__c IN: collegeIdSet]){
                                      if(!colledgeIdToStudentCountMap.containsKey(student.College_Name__c)){
                                          colledgeIdToStudentCountMap.put(student.College_Name__c, 0);
                                      }
                                      Integer count = colledgeIdToStudentCountMap.get(student.College_Name__c);
                                      count += 1;
                                      colledgeIdToStudentCountMap.put(student.College_Name__c, count);
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