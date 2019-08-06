Array.prototype.myEach = function(callback) {
  for(let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

// const arr = [1, 2, 3]
const callback = function (el) { console.log(el * 2);};
arr.myEach(callback);

// arr.myEach((el) => {
//   console.log(el * 2);
// });

arr.myEach((num) => {
  console.log(`square of ${num} is ${num * num}`);
});


Array.prototype.myMap = function(cb) {
    let new_map = [];
    
    this.myEach((el) => {
        new_map.push(cb(el));
    });
    // for (let i = 0; i < this.length; i++) {
    //     new_map.push( cb(this[i]) );
    // }
    return new_map;
}

var arr = [1, 2, 3]
var new_arr = console.log(arr.myMap( el => `this is our el: ${el}` ));

// console.log(NUMS.myMap(num => num * num)); # syntax sugar?

// arr.myMap ( (el) => {
//         console.log(el * 2);
//     }
// );

// const callback_2 = function (el) { console.log(`This is our element: ${el}`); };
// arr.myMap(callback_2);

Array.prototype.myReduce = function (cb, initialValue) {
    let dup = this 
    
    if (initialValue === undefined) {
      initialValue = dup.shift();
    }
    
    let start = initialValue;

    dup.myEach(el => {
      start = cb(start, el);
    });
    
    return start;
}

const sum = (el1, el2) => el1 + el2;
const mult = (el1, el2) => el1 * el2;
[1,2,3].myReduce(sum, 10); // 10 + 1 + 2 + 3
[1,2,3].myReduce(mult); //  1 * 2 * 3





// var counts = p.reduce(function (acc, prod) {
//     prod.ingredients.forEach(function (i) {
//         acc[i] = (acc[i] || 0) + 1;
//     });
//     return acc;
// }, {});


