import { LightningElement,api } from 'lwc';

export default class LwcDemo10Time extends LightningElement {
    timestamp = new Date();

    @api
    refreshTime(){
        this.timestamp = new Date();
        console.log("Child component method called");
    }
}