import React from 'react';

const DogIndex = () => {

  const breeds = [
    'Alaskan Malamute',
    'Greater Swiss Mountain Dog',
    'Bernese',
    'Labrador'
  ];

  const breedLis = breeds.map(
    (breed, i) => <li key={ i }>{ breed }</li>
  );

  return <ul>
    { breedLis }
  </ul>;

};

export default DogIndex;