import ReactOnRails from 'react-on-rails';

import HelloWorldApp from '../../HelloWorld/startup/HelloWorldApp';

import MainPage from '../containers/MainPage_sc';
import Index from '../index';


// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  MainPage,
  HelloWorld,
  Index
});
