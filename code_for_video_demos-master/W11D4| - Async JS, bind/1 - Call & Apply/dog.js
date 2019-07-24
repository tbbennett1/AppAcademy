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

const lola = new Dog("Lola");

// lola.sniffPerson("Tommy");

const sniff = Dog.prototype.sniffPerson;
// sniff();
// sniff.call(lola, "Tommy", "Mashu");
// sniff.call({name: "Toto"}, "Tommy")

sniff.apply(lola, ["Tommy", "Mashu"]);
const args = ["Tommy", "Mashu"];
sniff.call(lola, ...args);
sniff.apply(lola, args);

// Function.prototype.myFunction = function () {};

