import { LightningElement } from 'lwc';

export default class LwcDemo10CallingChildMethod extends LightningElement {
handleClick(event){
    this.template.querySelector('c-lwc-demo10-time').refreshTime();
}
}