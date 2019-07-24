import React from 'react';
import BleatIndex from './bleat_index_container';
import { Provider } from 'react-redux';
import BleatForm from './bleat_form_container';
import { HashRouter, Route } from 'react-router-dom';

const App = ({store, name}) => {
  // props.name = "something else" // this would be bad! don't do!!
  return <Provider store={ store }>
    <HashRouter>
      <section>
        <h1>Hello, { name }</h1>
        <Route path="/bleats/new" component={ BleatForm } />
        <Route exact path="/bleats" component={ BleatIndex } />
      </section>
    </HashRouter>
  </Provider>;
};

export default App;
