import { LightningElement,api } from 'lwc';

export default class LwcDemo9GetterSetter extends LightningElement {
    firstName = '';
    lastName = '';
    fullName = '';
    handleNameChange(event){
        var field = event.target.name;
         if(field === 'lastname') {
            this.lastName = event.target.value;
        }
        else if(field === 'firstname'){
             this.firstName = event.target.value;
        }
        this.fullName = this.firstName +' '+ this.lastName;
        //this.fullName.fname = this.firstName;
    }
    @api
    get uppercasename(){
        return this.fullName.toUpperCase();
    }
    set uppercasename(value){
        this.fullName = value.toUpperCase();
    }
}