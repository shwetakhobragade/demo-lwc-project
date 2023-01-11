import { LightningElement } from 'lwc';

export default class DemoProject extends LightningElement {
    handleClick(event){
        console.time('gameengine time');
        console.log('%c something!!! clicked for ','background: #222; color: #bada55; front-size
        console.timeEnd('gameengine time');
    }
}