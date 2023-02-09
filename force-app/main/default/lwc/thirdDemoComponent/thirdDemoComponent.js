import {  api,LightningElement } from 'lwc';




export default class ThirdDemoComponent extends LightningElement {
     @api retrivedUser;
     handlebuttonClick(){
          const selectedEvent = new CustomEvent('userclicked', { detail: this.retrivedUser.login });

        this.dispatchEvent(selectedEvent);
     }

}