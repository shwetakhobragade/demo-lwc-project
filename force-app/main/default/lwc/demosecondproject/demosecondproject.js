import { LightningElement, wire,api } from 'lwc';
import { subscribe, unsubscribe, APPLICATION_SCOPE, MessageContext} from 'lightning/messageService';
import searchMessage from '@salesforce/messageChannel/searchgit__c';
import insertContact from '@salesforce/apex/demoGitclass.insertContact';
import insertContact1 from '@salesforce/apex/demoGitclass.insertContact1';
const QUERY_USER_ENDPOINT_URL='https://api.github.com/search/users?q=';
export default class demosecondproject extends LightningElement {
    @api personName;
    retrivedusers=[];
    selecteduser ='';
    selecteduserArray=[];
    subscription = null;

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    disconnectedCallback() {
        this.unsubscribeToMessageChannel();
    }

    // Encapsulate logic for Lightning message service subscribe and unsubsubscribe
    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                searchMessage,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    async handleMessage(message) {
       console.log('handleMessage:', message);
       this.personName=message.searchTerm;
       let queryEndPoint=QUERY_USER_ENDPOINT_URL+this.personName;
       try{
        const RESPONSE=await fetch(queryEndPoint);
        const USER_LIST=await RESPONSE.json();
        console.log(USER_LIST.items);
        this.retrivedusers=USER_LIST.items;
       }catch(error){
          console.log(error); 
      }
    }

    unsubscribeToMessageChannel() {
        unsubscribe(this.subscription);
        this.subscription = null;
    }
    handleonuserclicked(event){
       
        console.log(event.detail); 
        
    this.selecteduser=event.detail;
    this.selecteduserArray.push(event.detail);
    
   
    }
    get showuser(){
        return this.selecteduser.length != 0 ? true: false;
    }
   async handleSaveUserClick(){
        console.log('save user in SF');
        try{
            const issuccess=await insertContact1({accNameList:this.selecteduserArray});
            
            console.log('created creation'+issuccess);
            }catch(error){
            console.log(error);
            }
                }
    
}