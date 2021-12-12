import { LightningElement,track } from 'lwc';

export default class LwcDemo5PrivatePropertyArray extends LightningElement {
    @track contacts = [
        {
            Id : 1,
            Name : 'Test Name 1',
            Title : 'Title 1'
        },
        {
            Id : 2,
            Name : 'Test Name 2',
            Title : 'Title 2'
        },
        {
            Id : 3,
            Name : 'Test Name 3',
            Title : 'Title 3'
        }
    ];
    handleClick(event){
        this.contacts[0].Name = "Anup kumar";
        console.log("Method Called");
    }
}