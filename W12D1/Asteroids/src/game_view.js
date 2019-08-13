const Game = require("./game.js");

function GameView(ctx) {
    this.ctx = ctx;
    this.game = new Game(1000, 600, 50000000000);
}

GameView.prototype.start = function() {
    window.setInterval(this.game.moveObjects, 20);
    window.setInterval(this.game.draw, 20);
}

GameView.prototype.moveObjects = function (){
    game.moveObjects();
}

GameView.prototype.draw = function (){
    game.draw(this.ctx);
}

module.exports = GameView;