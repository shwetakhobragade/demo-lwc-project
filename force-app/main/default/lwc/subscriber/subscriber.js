import { LightningElement, track } from 'lwc';
import { createMessageContext, releaseMessageContext, APPLICATION_SCOPE, subscribe, unsubscribe } from 'lightning/messageService';
import SAMPLECHANNEL from '@salesforce/messageChannel/SamplemessageChannel__c';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class Subscriber extends LightningElement {
    context = createMessageContext();
    subscription = null;
    @track receivedMessage = '';
    @track accountRecords = [];
    objectApiName = 'Account';
    fields = [NAME_FIELD, REVENUE_FIELD, INDUSTRY_FIELD];

    connectedCallback() {
        this.subscribeMC();
    }

    subscribeMC() {
        if (this.subscription) {
            return;
        }
        this.subscription = subscribe(this.context, SAMPLECHANNEL, (message) => {
            this.handleMessage(message);
        }, { scope: APPLICATION_SCOPE });
    }

    handleMessage(message) {
        console.log('message:::' + JSON.stringify(message));
        this.accountRecords.push(message.recordId);
        this.receivedMessage = message ? message.recordData.value : 'No Message Payload';
    }

    handleAccountClick() {
        if (this.accountRecords.length > 0) {
            this.accountRecords.forEach(accountId => {
                const accountRecordUrl = `/${accountId}`;
                window.open(accountRecordUrl, '_blank');
            });
        }
    }
}
