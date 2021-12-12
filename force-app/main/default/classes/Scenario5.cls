public class Scenario5 {
    public static void showOpportunityReport(){
        List<String> monthList = new List<String>{'','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
		Map <string,Decimal> typeMonthToTotalAmountMap = new Map<String,Decimal>();
        for(Opportunity opp : [SELECT Id,Name,CloseDate,Amount,Type
                              FROM Opportunity
                              WHERE Amount > 0
                               ORDER BY Type,CloseDate]){
                                   Integer month = opp.CloseDate.month();
                                   Integer year = opp.CloseDate.year();
                                   String monthString = monthList.get(month)+'-'+year;
                                   String key = opp.Type+'#'+monthString;
                                   if(!typeMonthToTotalAmountMap.containsKey(key)){
                                      typeMonthToTotalAmountMap.put(key, 0);
                                   }
                                   Decimal tempAmount = typeMonthToTotalAmountMap.get(key);
                                   tempAmount = tempAmount + opp.Amount;
                                   typeMonthToTotalAmountMap.put(key, tempAmount);
                                   
                               }
        for(String key : typeMonthToTotalAmountMap.keySet()){
            System.debug('>>>>'+key+'>>>>Total Amount'+typeMonthToTotalAmountMap.get(key));
        }
    }
}