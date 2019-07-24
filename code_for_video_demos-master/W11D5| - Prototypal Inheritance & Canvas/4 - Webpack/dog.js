const Animal = require("./animal.js");
// Animal.prototype.eat;

function Dog(name, toy) {
  Animal.call(this, name);
  this.favoriteToy = toy;
};

function Surrogate() {};
Surrogate.prototype = Animal.prototype;
Dog.prototype = new Surrogate();
Dog.prototype.constructor = Dog;

Dog.prototype.bark = function () {
  console.log("woof woof");
};

module.exports = Dog;