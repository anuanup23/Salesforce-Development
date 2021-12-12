public class ListDemo {
    public ListDemo(){
        List<String> colorList = new List<String>();
        colorList.add('Green');
        colorList.add('Yellow');
        colorList.add('Black');
        System.debug('List is '+colorList);
        Integer listSize = colorList.size();
        System.debug('List size is' +listSize);
        colorList.add('Yellow');
        System.debug('List size is ' +colorList.Size());
        String color = colorList.get(1);
        System.debug('color at index 1 is ' +color);
        
      
        List<String> tempList = new List<string>();
        tempList.add('Blue');
        tempList.add('Red');
        colorList.addAll(tempList);
        System.debug('List is ' +colorList);
        System.debug('List size is ' + colorList.size());
        
        for(Integer index = 0; index < colorList.size(); index++){
            color = colorList.get(index);
            System.debug('>>>>>Color at Index '+index+' is ' +color);
		}
        Integer index = 0;
        for(String colorName : colorList){
			System.debug('>>>>>Color at Index '+index+' is ' +colorName);   
            index++;
        }
        colorList.clear();
    }
}