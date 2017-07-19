import React from 'react';
import './styles/index.scss'

import {
  HashRouter,
  Route,
  Link
} from 'react-router-dom';

// Router
import routes from './router'

// render((
export default class Index extends React.Component {
	render(){
		return(
			<HashRouter basename="/" >
				{routes}
			</HashRouter>
		)
	}	
}
