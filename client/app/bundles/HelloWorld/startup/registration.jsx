import ReactOnRails from 'react-on-rails';

import HelloWorldApp from './HelloWorldApp';
import Index from '../../Tabi/index';
import MainPage from '../../Tabi/containers/MainPage_sc';


// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorldApp,
  Index

});
