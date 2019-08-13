const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");

function Asteroid(options) {
    COLOR = "red";
    RADIUS = 5;
    options.color = COLOR;
    options.radius = RADIUS;
    MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);
module.exports = Asteroid;