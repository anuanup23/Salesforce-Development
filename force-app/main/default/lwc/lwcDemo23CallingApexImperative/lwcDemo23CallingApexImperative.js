import { LightningElement,track } from 'lwc';
import getAccountList from '@salesforce/apex/LWCDemo22Controller.getAccountList';
import getContactList from '@salesforce/apex/LWCDemo22Controller.getContactList';
 
export default class LwcDemo23ImperativeApexCall extends LightningElement {
   value = 'none';
   @track options = [];
   allcontacts;
 
   renderedCallback(){
       if(this.options.length == 0){
           getAccountList().then(data => {
               if(data){
                   let tempArray = [];
                   const temp =  { label: 'None', value: 'none' };
                   tempArray.push(temp);
                   for(var acc of data){
                       var tempacc = { label: acc.Name, value:acc.Id };
                       tempArray.push(tempacc);
                   }
                   this.options = tempArray;
               }
           }).catch(error => {
                // error handling
           });
       }
   }
 
   handleChange(event){
       this.value = event.target.value;
       getContactList({selectedAccountId : this.value}).then(data =>{
           this.allcontacts = data;
       }).catch(error=>{
           // error handling
       });
   }
 
}