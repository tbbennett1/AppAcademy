const Animal = require("./animal.js");

function Cat(name) {
  Animal.call(this, name);
}

function Surrogate() {}
Surrogate.prototype = Animal.prototype;
Cat.prototype = new Surrogate();
Cat.prototype.constructor = Cat;

Cat.prototype.meow = function () {
  console.log("meow");
};

module.exports = Cat;