// ===================================
// ==========  JAVASCRIPT  ===========
// ===================================

console.log("Hello, World!");

// -----------------------------------
// --  DIFFERENCES BETWEEN JS & RB  --
// -----------------------------------

// Flasey values
// in Ruby: nil, false
// in JS: null, false, undefined, NaN, '', 0, -0

// explicit returns

// [] === [] // false
// [] == 5 // == does type coercion

// camelCase | snake_case

// const x = function (num) { return 3 * num };

// (10 + 5) > 20 ? console.log('big') : console.log('small');

// console.log(x)

// const y = function (arg1) {};
// y(5);

// Data types (primitives):
// String
// Number
// Boolean
// null
// undefined
// Symbol

// Object
// {
//   tommy: "hi",
//   "mashu": 5,
//   maia: function () {}
// }
// Array [1, 2, 3, 4, 5];
// Function function () {};


// -----------------------------------
// -----  VARIABLE DECLARATION  ------
// -----------------------------------

var name = "tommy";
name;

const lName = "Duek";
// lName = "something else";

const myArr = [];
myArr.push(5);

let someVar = 5;
someVar = 6;

let i = 0;
let test = 0;
while (i < 1) {
  test = 'hi';
  i++;
  if (true) {
    var test2 = "test"
    console.log(test);
  }
}
console.log(test);
console.log(test2);

const myFunc = function () {
  var x = 5;
  console.log(x);
};
myFunc();
console.log(x);

