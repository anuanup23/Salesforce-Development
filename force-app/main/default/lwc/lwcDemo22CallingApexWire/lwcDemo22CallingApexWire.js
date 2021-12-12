import { LightningElement , wire, track} from 'lwc';
import getAccountList from '@salesforce/apex/LWCDemo22Controller.getAccountList';
import getContactList from '@salesforce/apex/LWCDemo22Controller.getContactList';
export default class LwcDemo22CallingApexWire extends LightningElement {
    value = 'none';
    @track options = [];
    @wire(getAccountList) wiredAccount({error,data}){
        if(data){
            let tempArray = [];
            const temp = {label : 'None', value: 'none'};
            tempArray.push(temp);
            for(var acc of data){
                var tempacc = {label:acc.Name, value:acc.Id};
                tempArray.push(tempacc);
            }
            this.options = tempArray;
            
        }
        else if(error){

        }
    }
    handleChange(event){
        this.value = event.target.value;
    }
  
  
    @wire(getContactList,{selectedAccountId : '$value'}) allcontacts;
}