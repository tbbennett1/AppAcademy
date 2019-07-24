import React from 'react';
import BleatIndex from './bleat_index_container';
import { Provider } from 'react-redux';
import BleatForm from './bleat_form_container';

const App = ({store, name}) => {
  // props.name = "something else" // this would be bad! don't do!!
  return <Provider store={ store }>
    <section>
      <h1>Hello, { name }</h1>
      <BleatForm />
      <BleatIndex />
    </section>
  </Provider>;
};

export default App;
