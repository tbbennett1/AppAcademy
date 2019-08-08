let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = Array.from(Array(8), () => new Array(8));
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  try {
    if (this.isValidPos(pos) === false) throw "Not valid pos!";
    
  } catch (error) {
    console.log(error);
  };

  if (this.isOccupied(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    return undefined;
  } 
};


/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.getPiece(pos)) {
    return this.getPiece(pos).color === color; 
  };
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return (this.grid[pos[0]][pos[1]] === undefined ? false : true)
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  const row = pos[0];
  const col = pos[1];
  if (row >= 0 && row <= 7 && col >= 0 && col <= 7){
    return true;
  } else {
    return false;
  };
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip = []) { // [1, 1] 
    let dx = pos[0];
    let dy = pos[1];
    let newPos = pos;
    
    
    while (board.isValidPos(newPos)) {
      dx = dx + dir[0]; 
      dy = dy + dir[1];
      newPos = [dx, dy]; // newPos = [4,4]

      if (!board.isOccupied(newPos)) {
        break;
      } else if (board.getPiece(newPos).color === color) {
        break;
      } else {
        // if this position is occupied and is oppColor
        // continue until another self's color is found 
        piecesToFlip.push(newPos);
      };
    };


    if (piecesToFlip.length === 0) {
      return null;
    }else{
      return piecesToFlip;
    };
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {

};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */ 
// color = black
Board.prototype.validMove = function (pos, color) {
  //if one move is valid
  let flippablePos = [];
  debugger;
  if (this.isOccupied(pos)) {
    return false;
  } else {
    Board.DIRS.forEach(direction => {
      if (_positionsToFlip(this, pos, color, direction)) {
        flippablePos.push(_positionsToFlip(this, pos, color, direction));
      };
    });
  };
  
  if (flippablePos.length === 0) {
    return false;
  } else {
    return true;
  }
 
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
// if color === "B"
// find all the white color pieces, and get their neighbourPos
Board.prototype.validMoves = function (color) { // we are black, opp = white

  

  // Get all the valid neighbour positions
  // let neighbourPos = []; 
  // oppColorPos.forEach(pos => {
  //   Board.DIRS.forEach(dir => {
  //     let dx = pos[0] + dir[0];
  //     let dy = pos[1] + dir[1];

  //     if (!this.isOccupied([dx, dy]) && this.isValidPos([dx, dy])) {
  //       Board.DIRS.forEach(direction => {
  //         flippablePos.concat(_positionsToFlip(this, neighbour, color, direction));
  //       });
  //       neighbourPos.push([dx, dy]);
  //       };
  //   });
  // });
    
  // // checking for flippable pieces
  
  // const flippablePos = [];
  //  neighbourPos.forEach(neighbour => {
    
  // });

  // return flippablePos;
};

const board = new Board();
board.validMove([2,3], "white");
// debugger;

module.exports = Board;