function Animal(name) {
  this.name = name;
};

// function Surrogate() {};

Animal.prototype.eat = function () {
  console.log("nom nom nom");
};

module.exports = Animal;