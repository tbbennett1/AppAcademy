function Dog(name) {
  this.name = name;
}

Dog.prototype.sniffPerson = function (person, person2) {
  let msg = `${ this.name } is sniffing ${ person }`;
  if (person2) {
    msg += ` and ${ person2 }`
  }
  console.log(msg);
};

Dog.prototype.sniffPpl = function (ppl) {
  // ppl.forEach(function (person) {
  //   this.sniffPerson(person);
  // });

  this; // lola
  // const that = this;
  // const theCb = function (person) {
  //   // console.log(Object.keys(this));
  //   that.sniffPerson(person);
  // };
  // ppl.forEach(theCb);

  // const theCb = function (person) {
  //   console.log("running the cb, this.name = " + this.name);
  //   // console.log(Object.keys(this));
  //   this.sniffPerson(person);
  // };
  // console.log("about to bind the cb");
  // const boundCb = theCb.bind(this);
  // console.log("about to call the forEach");
  // ppl.forEach(boundCb);

  const theCb = function (person) {
    this.sniffPerson(person);
  }.bind(this);
  ppl.forEach(theCb);
};

// Array.prototype.forEach = function (cb) {
//   for (let i = 0; i < this.length; i++) {
//     const el = this[i];
//     cb(el);
//   }
// };


const lola = new Dog("Lola");
const people = ["Tommy", "Mashu", "Jesse"];

lola.sniffPpl(people);