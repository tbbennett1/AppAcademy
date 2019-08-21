import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board'

class Game extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(9, 16)
    };

    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, isFlagged) {

    if(isFlagged){
      tile.toggleFlag();
    } else {
      tile.explore();
    }
    this.setState({board: this.state.board});
  }

  render() {

    if (this.state.board.won()){
      return <h1>You Won!</h1>;
    } else if (this.state.board.lost()){
      let modal = document.getElementsByClassName("modal")[0];
      modal.className = 'modal is-active';
      let button = document.getElementsByTagName('button')[0];
    //   debugger
      button.addEventListener("click", this.restartGame);
    }

    return <Board board={this.state.board} updateGame={this.updateGame}/>

  }

  restartGame() {

    let modal = document.getElementsByClassName("modal")[0];
    modal.className = 'modal';

    this.setState({ board: new Minesweeper.Board(9, 16) })
    
    //   debugger

  }

}

export default Game;