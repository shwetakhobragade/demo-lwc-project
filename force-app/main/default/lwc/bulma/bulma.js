import { LightningElement, } from 'lwc';

import { loadStyle } from 'lightning/platformResourceLoader';
import bulma from '@salesforce/resourceUrl/bulma';
export default class Bulma extends LightningElement {
    connectedCallback() {
        loadStyle(this, bulma);
    }
    firstName;
    LastName;

    handleChanges(event){
        if(event.target.name==='firstName'){
            this.firstName= event.target.value;
        }
        if(event.target.name==='LastName'){
            this.LastName= event.target.value;
        }
        
    }
}