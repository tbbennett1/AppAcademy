import React from 'react';
import BenchIndex from "../bench/bench_index"
import BenchMap from "../bench/bench_map"

class Search extends React.Component{
  render(){
    //   debugger
    return (<div>
      <BenchIndex benches={this.props.benches} fetchBenches={this.props.fetchBenches}/>
      <BenchMap benches={this.props.benches}/>
    </div>)
  }
}

export default Search;