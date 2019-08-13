const Asteroid = require("./asteroid.js");

function Game(DIM_X, DIM_Y, NUM_ASTEROIDS) {
    this.DIM_X = DIM_X;
    this.DIM_Y = DIM_Y;
    this.NUM_ASTEROIDS = NUM_ASTEROIDS;
    this.asteroids = [];
    this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
    let asteroid = new Asteroid(this.randomPosition());
    this.asteroids.push(asteroid);
}

Game.prototype.randomPosition = function() {
    let row = Math.floor(Math.random() * 600);
    let col = Math.floor(Math.random() * 1000);
    return [row, col];
}

Game.prototype.moveObjects = function() {
    this.asteroids.forEach( ast => {
       return ast.move();
    });
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect();
  this.asteroids.forEach( (asteroid) => {
    asteroid.draw();
  });
}

Game.prototype.wrap = function(pos) {
  this.asteroids.forEach(ast => {
    if (ast.pos[0] === 600) {
      ast.pos[0] = 0;
    } else if (ast.pos[0] === 0) {
      ast.pos[0] = 600;
    } else if (ast.pos[1] === 1000) {
      ast.pos[1] = 0;
    } else if (ast.pos[1] === 0) {
      ast.pos[1] = 1000;
    }
  })
}

module.exports = Game;
