function Dog(name, toy) {
  // this.name = name;
  this;
  Animal.call(this, name);
  this.favoriteToy = toy;
};

// Dog.prototype = Animal.prototype;
// Dog.prototype = new Animal();
function Surrogate() {
  // this.constructor = Dog;
};
Surrogate.prototype = Animal.prototype;
Dog.prototype = new Surrogate();

// Dog.prototype = Object.create(Animal.prototype);
Dog.prototype.constructor = Dog;

Dog.prototype.bark = function () {
  console.log("woof woof");
};

// Dog.prototype = new Surrogate();

function Cat(name) {
  // this.name = name;
  Animal.call(this, name);
}
// Cat.prototype = Animal.prototype;
function Surrogate() {
  // this.constructor = Cat;
}
Cat.prototype = new Surrogate();
Cat.prototype.constructor = Cat;

Cat.prototype.meow = function () {
  console.log("meow");
};

function Animal(name) {
  // this;
  this.name = name;
};

Animal.prototype.eat = function () {
  console.log("nom nom nom");
};

const lola = new Dog("Lola", "sqweaky frog");
const charlie = new Cat("Charlie");






//                          Dog.prototype
// lola                     (new Surrogate)              Animal.prototype
// {                        {                            {
//   name: 'Lola',            bark: function () {},        eat: function () {},
//   favoriteToy: 'frog'      __proto__: ->                constructor: Animal
//   __proto__: ->            constructor: Dog             __proto__: Object.prototype
// }                        }                            }

// const a = new Animal();
// a = {
//   name: undefined,
//   __proto__: Animal.prototype
// }


class Animal {
  constructor(name) {
    // do stuff
  }

  eat() {

  }
}

class Dog extends Animal {
  constructor(name, favToy) {

  }

  bark() {
    // do stuff
  }
}