import { LightningElement } from 'lwc';

export default class LwcDemo3ConditionalRendering extends LightningElement {
    isDetailsVisible = false;
    handleChange(event){
        this.isDetailsVisible = event.target.checked;
    }
}