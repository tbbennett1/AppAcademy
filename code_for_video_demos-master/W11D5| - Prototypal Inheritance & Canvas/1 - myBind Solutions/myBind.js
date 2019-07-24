// simple myBind with no args
Function.prototype.myBind = function (ctx) {
  // this = function () {
  //   debugger;
  //   console.log(`${this.name} says meow!`);
  // };
  debugger;
  return () => {
    debugger
    return this.apply(ctx);
  }
};

// myBind with arguments
Function.prototype.myBind = function (ctx, ...bindArgs) {
  bindArgs // ["Tommy"]
  this; // playWith
  return (...callArgs) => {
    callArgs // ["Mashu"]
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
};

Function.prototype.myBind = function (ctx) {
  // debugger;
  // var bindArgs = Array.prototype.slice.call(arguments, 1);
  var bindArgs = [].slice.call(arguments, 1);
  var that = this;
  return function () {
    var callArgs = [].slice.call(arguments);
    // callArgs // ["Mashu"]
    return that.apply(ctx, bindArgs.concat(callArgs));
  };
};

// Array.protoype.slice = function (i = 0) {
//   const result = [];
//   for (let i = i; i < this.length; i++) {
//     result.push(this[i])
//   }
//   return result;
// };
// [1,2,3].slice(1);


class Cat {
  constructor(name) {
    this.name = name;
  }

  meow() {
    debugger;
    console.log(`${this.name} says meow!`);
  }

  playWith(person1, person2) {
    console.log(`${ this.name } plays with ${ person1 } and ${ person2 }`)
  }
}

const curie = new Cat("Curie");
// const unboundMeow = curie.meow;
const unboundMeow = Cat.prototype.meow;
// const boundMeow = unboundMeow.myBind(curie);
// setTimeout(boundMeow, 1000);

const unboundPlayWith = Cat.prototype.playWith;
const boundPlayWith = unboundPlayWith.myBind(curie, "Tommy");
boundPlayWith("Mashu");



