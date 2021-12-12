import { LightningElement } from 'lwc';

export default class LwcDemo12LifeCycle extends LightningElement {
    message = "Hello MTX";
    count = 0;
    handleClick(event){
        this.message = "Updated Message";
    }
    constructor(){
        super();
        console.log("constructor Get Called");
    }
    connectedCallback(){
        console.log("connectedCallback get Called");
    }
    renderedCallback(){
        if(this.count == 0){
            console.log("renderedCallback get called");
            this.count = this.count + 1;
            this.message = "This get called "+this.count+" times";
        }
    }
    disconnectedCallback(){
        console.log("disconnectedCallback get called");
    }
}