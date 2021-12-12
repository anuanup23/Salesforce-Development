import { LightningElement,api } from 'lwc';

export default class LwcDemo14ContactDetails extends LightningElement {
    @api contactdetails;
    
    selectHandler(event){
        const selectedEvent = new CustomEvent('selected',{detail : this.contactdetails.Id,bubbles : true});
        //console.log('>>>>'+JSON.stringify(selectedEvent));
        this.dispatchEvent(selectedEvent);
    }
}