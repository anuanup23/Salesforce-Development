public class MapDemo {
	
    public MapDemo(){
        Map<String, String> keyToColorMap = new Map<String,String>();
        // put to add values
        keyToColorMap.put('Key1', 'Yellow');
        keyToColorMap.put('Key2', 'Green');
        keyToColorMap.put('Key3', 'Black');
        keyToColorMap.put('Key4', 'Red');
        
        System.debug('size of the Map is '+ keyToColorMap.size());
        String color = keyToColorMap.get('Key3');
        System.debug('color value at Key3 is '+color);
        keyToColorMap.put('Key3', 'Blue');
        System.debug('color value at Key3 is '+keyToColorMap.get('Key3'));
        Set<String>  colorKeySet = keyToColorMap.keySet();
        System.debug('Keys Set is ' +colorKeySet);
        List<String> colorValuesList =  new List<String>();
        colorValuesList = keyToColorMap.values();
        System.debug('Lists values are ' +colorValuesList);
        for(String key : keyToColorMap.keySet()){
            System.debug('Value at Key : '+key+' is ' +keyToColorMap.get(key));
        }
        System.debug('Do my map contains Key3 ' +keyToColorMap.containsKey('Key3'));
        keyToColorMap.clear();
        System.debug('Size of the Map is '+ keyToColorMap.size());
    }
}