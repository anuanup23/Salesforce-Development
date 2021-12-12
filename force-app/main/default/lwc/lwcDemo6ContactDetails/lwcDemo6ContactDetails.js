import { LightningElement,api } from 'lwc';

export default class LwcDemo6ContactDetails extends LightningElement {
    @api contactdetails;
    handleClick(event){
        console.log("**********");
        this.contactdetails.Name = "Anup Kr";
        console.log("******* " + this.contactdetails.Name );
    }
    //objects passed to components are read only we can update them using events
    updateContact(event){
        this.contactdetails = {
            Id:22,
            Title : "Test Title",
            Name : "Sahil Test"
        };
        console.log("&&&&&&&&");
    }
}