import { LightningElement,wire } from 'lwc';
import getAccountList from '@salesforce/apex/LWCDemo24Controller.getAccountList';
import updateAccountList from '@salesforce/apex/LWCDemo24Controller.updateAccountList';
import {refreshApex} from '@salesforce/apex'
 
export default class LwcDemo24RefreshApex extends LightningElement {
   @wire(getAccountList) allAccounts;
 
   handleClick(event){
       updateAccountList().then(data =>{
           alert('Record updated');
           //return refreshApex(this.allAccounts);
       }).catch(error=>{
 
       });
   }
}