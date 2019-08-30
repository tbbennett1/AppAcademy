import React from 'react';
import BenchIndexItem from "./bench_index_item"

class BenchIndex extends React.Component {
    componentDidMount() {
        this.props.fetchBenches();
    }

    render() {
        const { benches } = this.props;
        return (
            <div>
                <ul>
                    {
                        benches.map(bench => (
                            <BenchIndexItem
                                key={`bench${bench.id}`}
                                bench={bench} 
                            />
                        )
                        )
                    }
                </ul>
            </div>
        )
    }
}

export default BenchIndex