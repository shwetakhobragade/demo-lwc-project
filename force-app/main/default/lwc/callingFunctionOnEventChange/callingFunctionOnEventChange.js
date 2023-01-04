import { LightningElement } from 'lwc';

export default class CallingFunctionOnEventChange extends LightningElement {
    greeting='World';
    changeHandler(event) {
        this.greeting = event.target.value;
    }
}