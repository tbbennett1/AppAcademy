import React from 'react';

class BenchIndexItem extends React.Component {

    render() {
        return (
            <li>
                <h3>{this.props.bench.description}</h3>
                <p>longitude: {this.props.bench.lng}</p>
                <p>latitude: {this.props.bench.lat}</p>
            </li>
        );
    }
}

export default BenchIndexItem