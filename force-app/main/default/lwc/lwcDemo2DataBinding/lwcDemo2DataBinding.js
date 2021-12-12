import { LightningElement ,track} from 'lwc';

export default class LwcDemo2DataBinding extends LightningElement {
    greeting = 'Welcome to MTX';
    firstName = '';
    lastName = '';
    fullName = {fname:'',lname:''};
    handleChange(event){
        this.greeting = event.target.value;
    }
    handleNameChange(event){
        var field = event.target.name;
         if(field === 'lastname') {
            this.lastName = event.target.value;
        }
        else if(field === 'firstname'){
             this.firstName = event.target.value;
        }
        this.fullName = {fname:this.firstName,lname :this.lastName};
        //this.fullName.fname = this.firstName;
    }
}