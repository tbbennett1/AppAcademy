import React from 'react';

class Tile extends React.Component{
  constructor(props) {
    super(props)
    this.tile = this.props.tile;
    // this.updateGame = this.props.updateGame;
    this.handleClick = this.handleClick.bind(this);
 
  }

  handleClick(event) {
    event.preventDefault();

    const flag = event.shiftKey ? true : false;
    
    this.props.updateGame(this.tile, flag);

  }

  render(){

    let content;
    let klass;
    if (this.tile.explored) {
      klass = "explored"
      if (this.tile.bombed) {
        content = '&#128163';
      } else {
        if (this.tile.adjacentBombCount() === 0){
          content = "";
        }else {
        content = this.tile.adjacentBombCount();
        }
      }
    } else {
      klass = "unexplored"
      if (this.tile.flagged) {
        content = '&#x2691';
      } else {
        content = "";
      }
    }
    return <div className={klass} onClick={this.handleClick} >{content}</div>
  }


}

export default Tile;