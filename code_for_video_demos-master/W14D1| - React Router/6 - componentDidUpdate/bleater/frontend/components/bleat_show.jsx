import React from 'react';

class BleatShow extends React.Component {

  componentDidMount() {
    // debugger;
    // setTimeout(() => this.props.fetchBleat(), 5000);
    this.props.fetchBleat();
  }

  componentDidUpdate(prevProps) {
    debugger;
    if (this.props.match.params.bleatId !== prevProps.match.params.bleatId) {
      this.props.fetchBleat();
    }
  }

  render() {
    // debugger;
    if (!this.props.bleat) {
      return <span>No bleat (yet)!</span>
    }

    return <article>
      <h2>{ this.props.bleat.author.email } says...</h2>
      <p>{ this.props.bleat.body }</p>
    </article>;
  }
};

export default BleatShow;