import React from 'react';
import DogIndex from './dog_index';
import BleatIndex from './bleat_index';

const App = ({name}) => {
  // props.name = "something else" // this would be bad! don't do!!
  return <section>
    <h1>Hello, { name }</h1>
    <DogIndex />
    <BleatIndex />
  </section>
};

export default App;
