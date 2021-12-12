import { LightningElement} from 'lwc';

export default class LwcDemo14EventDemo extends LightningElement {
    /*constructor(){
        super();
        this.template.addEventListener('selected',this.contactSelected);
        }*/
        selectedContact={};
    contacts = [
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
    contactSelected(event){
        const selectedContactId = event.detail;
        console.log('@@@@'+JSON.stringify(selectedContactId));
        this.selectedContact = this.contacts.find(contact => contact.Id == selectedContactId);
        console.log('@@@@@@'+JSON.stringify(this.selectedContact));
    }
}