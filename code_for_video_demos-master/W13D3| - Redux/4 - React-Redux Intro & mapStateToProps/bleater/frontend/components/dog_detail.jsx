import React from 'react';

const DogDetail = ({vote, breed, totalVotes}) => {
  return <li onClick={ vote }>
    { breed }. Total votes: { totalVotes }
  </li>;
};

export default DogDetail;