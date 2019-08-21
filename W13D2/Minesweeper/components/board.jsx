import React from 'react';
import Tile from './tile';


class Board extends React.Component {

    render() {
// debugger
      const gridmap = this.props.board.grid.map((row, idx1) => {
          const tiles = row.map((tile, idx2) => <div><Tile tile={tile} updateGame={this.props.updateGame}/></div>)
          return <div className="row">
              {tiles}
          </div>
      })

        return (
          <div> 
            {gridmap}
          </div>
        )   
    }
}

export default Board;

