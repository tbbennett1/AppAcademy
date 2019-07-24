import React from 'react';
import DogIndex from './dog_index';
import BleatIndex from './bleat_index_container';
import { Provider } from 'react-redux';

const App = ({store, name}) => {
  // props.name = "something else" // this would be bad! don't do!!
  return <Provider store={ store }>
    <section>
      <h1>Hello, { name }</h1>
      <DogIndex />
      <BleatIndex />
    </section>
  </Provider>;
};

export default App;
