// -----------------------------------
// -----------  HOISTING  ------------
// -----------------------------------
var myVar;

// debugger

myVar = 5;

let favFood = 'Taco';
if (true) {
  console.log(favFood);
  favFood = 'Pizza';
  console.log(favFood);
  myOtherFunc();
}
console.log(favFood);

debugger;
var myFunc = function () {};

function myOtherFunc() {};
myOtherFunc();






