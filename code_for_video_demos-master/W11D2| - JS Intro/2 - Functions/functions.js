// -----------------------------------
// ----------  FUNCTIONS  ------------
// -----------------------------------

const myFunc = function () {};
myFunc("Tommy", "Mashu");
function myNamedFunc() {};

myFunc();
myNamedFunc();

function sayHi(name) {
  console.log(`Hi ${ name }`);
};
sayHi("Tommy");

const person = {
  name: "Tommy",
  sayHi: function () {
    this;
    debugger;
    console.log(`${ this.name } says hi!`)
  }
};

// person.sayHi() // method style, `this` is the receiver

let mySayHi = person.sayHi;
// mySayHi(); // function-style, `this` is the window or undefined


// new mySayHi();

function Cat(name) {
  this;
  this.name = name; 
};

Cat.prototype.meow = function () {
  console.log(`${ this.name } says meow`);
};

const sennacy = new Cat("Sennacy"); // constructor style, `this` is the instance getting created
sennacy.meow();
const paprika = new Cat("Paprika");

// Fat arrow functions

const otherFunc = () => {
  return 5;
};
const anotherFunc = () => 5;


function Dog(name) {
  this;
  this.name = name;
  this.myFatFunc = () => {
    this;
    debugger;
  };
};




