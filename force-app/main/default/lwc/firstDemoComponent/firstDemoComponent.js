import { LightningElement,track,wire} from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import searchMessage from '@salesforce/messageChannel/searchgit__c';
export default class FirstComponent extends LightningElement {
    @track  searchText;
    
    @wire(MessageContext)
    messageContext;
    handleClick(event){
    let inputvalue=this.template.querySelectorAll("lightning-input")[0].value;
    const payload = { isTermvalid:true, searchTerm:inputvalue };

        publish(this.messageContext, searchMessage, payload);
    }
    
   
}