import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
 
export default class LwcDemo27NavigationService extends  NavigationMixin(LightningElement)  {
 
   navigatetohomepage(){
       this[NavigationMixin.Navigate]({
           type: 'standard__objectPage',
           attributes: {
               objectApiName: 'Account',
               actionName: 'home',
           },
       });
   }
 
   navigatetorecord(){
       this[NavigationMixin.Navigate]({
           type: 'standard__recordPage',
           attributes: {
               recordId: '0015g00000G3uJ3AAJ',
               actionName: 'view',
           },
       });
   }
 
   navigatetotab(){
       this[NavigationMixin.Navigate]({
           type: 'standard__navItemPage',
           attributes: {
               apiName: 'lwcDemo'
           },
       });
   }
 
   createnewrecord(){
       this[NavigationMixin.Navigate]({
           type: 'standard__objectPage',
           attributes: {
               objectApiName: 'Account',
               actionName: 'new'
           },
       });
 
   }
 
   gotoexternalurl(){
       this[NavigationMixin.Navigate]({
           type: 'standard__webPage',
           attributes: {
               url: 'http://salesforce.com'
           },
       });
   }
}