import React from 'react';
import DogDetail from './dog_detail';

class DogIndex extends React.Component {

  constructor(props) {
    super(props)

    this.state = {votes: 0};
    // this.setState({name: "Tommy"});
    // this.state.name = "Tommy" // VERY bad! Don't do this!!
    this.vote = this.vote.bind(this);
  }

  vote() {
    this.setState({votes: this.state.votes + 1});
  }

  render() {
    const breeds = [
      'Alaskan Malamute',
      'Greater Swiss Mountain Dog',
      'Bernese',
      'Labrador'
    ];

    const breedLis = breeds.map(
      (breed, i) => <DogDetail 
        key={ i } 
        breed={ breed } 
        vote={ this.vote }
        totalVotes={ this.state.votes }
      />
    );

    return <section>
      <span>Votes: { this.state.votes }</span>
      <ul>
        { breedLis }
      </ul>
    </section>;
  }

};

export default DogIndex;