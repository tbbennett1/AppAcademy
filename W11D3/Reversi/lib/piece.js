/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
    this.color = color;
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
    return this.color = (this.color === "black" ? "white" : "black");
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
  return this.oppColor();
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
  return letter = (this.color === "black" ? "B" : "W")
};

// const piece = new Piece("black");
// debugger;
// piece.flip();

module.exports = Piece;

