import React from 'react';
import { fetchBleats } from '../util/apiUtil';  

class BleatIndex extends React.Component {

  constructor(props) {
    debugger;
    super(props)
    this.state = {};
  }

  componentDidMount() {
    // this;
    // fetchBleats().then(
    //   bleats => this.setState({bleats: bleats})
    // );
  }

  render() {
    debugger;
    if (this.props.bleats.length == 0) {
      return <span>No bleats to display :(</span>;
    }

    const bleatLis = this.props.bleats.map(bleat => {
      return <li key={ bleat.id }>{ bleat.body }</li>
    });

    return <ul>{ bleatLis }</ul>;
  }

};

export default BleatIndex;