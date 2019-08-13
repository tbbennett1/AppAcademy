// const Game = require("./game.js");
const GameView = require("./game_view.js");
const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");


window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.GameView = GameView;

window.addEventListener('DOMContentLoaded', (event) => {
    console.log("were in the event listener")
    const doc = document.getElementById('game-canvas');
    let ctx = doc.getContext("2d");
    // const mo = new MovingObject({ pos: [20, 20], vel: [0, 0], radius: 5, color: "red" });
    // mo.draw(ctx);
    const gameview = new GameView(ctx);
    gameview.start();
    });