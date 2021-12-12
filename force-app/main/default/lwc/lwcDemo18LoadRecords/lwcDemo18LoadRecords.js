import { LightningElement,api,wire } from 'lwc';
import {showToastEvent} from 'lightning/platformShowToastEvent'
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class LwcDemo18LoadRecords extends LightningElement {
    @api recordId;
    handlesubmit(event){
        const toastevent = new showToastEvent({
            title : 'Success',
            message : 'Recors Updated',
        });
        this.dispatchEvent(toastevent);
    }
    @wire(getRecord, {recordId : '$recordId', fields :
    [NAME_FIELD,REVENUE_FIELD,INDUSTRY_FIELD]}) myRecord;

    get nameValue(){
        console.log('>>>>>>>'+JSON.stringify(this.myRecord));
        return this.myRecord.data ? getFieldValue(this.myRecord.data,NAME_FIELD) : '';
    }
    get industryValue(){
        return this.myRecord.data ? getFieldValue(this.myRecord.data,INDUSTRY_FIELD) : '';
    }
    get revenueValue(){
        return this.myRecord.data ? getFieldValue(this.myRecord.data,REVENUE_FIELD) : '';
    }
}