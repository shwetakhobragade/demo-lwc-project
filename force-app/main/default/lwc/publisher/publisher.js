import { LightningElement, track, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import { createMessageContext, releaseMessageContext, publish } from 'lightning/messageService';
import SAMPLE_CHANNEL from "@salesforce/messageChannel/SamplemessageChannel__c";
export default class Publisher extends NavigationMixin(LightningElement) {
    context = createMessageContext();
    @track accountList;
    connectedCallback() {
        this.fetchAccounts();
    }
    fetchAccounts() {
        getAccounts()
            .then(result => {
                this.accountList = result;
            })
            .catch(error => {
                this.accountList = error;
            });
    }
    handleClick(event) {
        event.preventDefault();
        const accountId = event.target.dataset.value;
        const message = {
            recordId: accountId,
            recordData: { value: "Message from Lightning web component" }
        };
        publish(this.context, SAMPLE_CHANNEL, message);
        this.openAccountTab(accountId);
    }
    openAccountTab(accountId) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: accountId,
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
    }
}