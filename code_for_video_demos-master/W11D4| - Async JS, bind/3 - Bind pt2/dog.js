function Dog(name) {
  this.name = name;
}

Dog.prototype.sniffPerson = function (person, person2) {
  let msg = `${ this.name } is sniffing ${ person }`;
  if (person2 && person2 instanceof String) {
    msg += ` and ${ person2 }`
  }
  console.log(msg);
};

Dog.prototype.sniffPpl = function (ppl) {
  this; // lola

  // const theCb = function (person) {
  //   this.sniffPerson(person);
  // }.bind(this);

  // ppl.forEach(theCb);

  // ppl.forEach(this.sniffPerson);
  // const sniffPerson = function (person, person2) {
  //   let msg = `${ this.name } is sniffing ${ person }`;
  //   if (person2 && person2 instanceof String) {
  //     msg += ` and ${ person2 }`
  //   }
  //   console.log(msg);
  // }.bind(this);
  // ppl.forEach(sniffPerson);

  ppl.forEach(this.sniffPerson.bind(this));
  // ppl.forEach(Dog.prototype.sniffPerson.bind(this));
};

// Array.prototype.forEach = function (cb) {
//   for (let i = 0; i < this.length; i++) {
//     const el = this[i];
//     cb(el, i);
//   }
// };


const lola = new Dog("Lola");
const people = ["Tommy", "Mashu", "Jesse"];

lola.sniffPpl(people);