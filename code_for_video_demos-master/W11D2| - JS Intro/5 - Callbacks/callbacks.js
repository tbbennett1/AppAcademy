// -----------------------------------
// ----------   CALLBACKS  -----------
// -----------------------------------

const a = [1, 2, 3, 4, 5];

a.forEach(function (el) {
  console.log(el);
});

const myCb = function (el) {
  console.log(el);
};
a.forEach(myCb)


const each = function (arr, cb) {
  for (let i = 0; i < arr.length; i++) {
    const theEl = arr[i];
    cb(theEl);
  }
};

each(a, function (el) {
  console.log(el);
});

each(a, myCb);

















// WAT Video: https://www.destroyallsoftware.com/talks/wat