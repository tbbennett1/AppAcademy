import React from 'react';
import DogIndex from './dog_index';

const App = ({name}) => {
  // props.name = "something else" // this would be bad! don't do!!
  return <section>
    <h1>Hello, { name }</h1>
    <DogIndex />
  </section>
};

export default App;
