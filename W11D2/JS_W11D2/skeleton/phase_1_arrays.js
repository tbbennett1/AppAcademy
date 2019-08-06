Array.prototype.uniq = function() {
    let uniqueArray = [];

    this.forEach(function(el) {
        if (!uniqueArray.includes(el)) {
            uniqueArray.push(el);
        }
    });
    return uniqueArray;
  };

arr = [1,1,2,2,3,4,5,5];
console.log(arr.uniq());

//**WRONG WAY */
// Array.prototype.uniq = () => {
//     let uniqueArray = [];

//     this.forEach(function (el) {
//         if (!uniqueArray.includes(el)) {
//             uniqueArray.push(el);
//         }
//     });
//     return uniqueArray;
// };

// arr = [1, 1, 2, 2, 3, 4, 5, 5];
// arr.uniq();

Array.prototype.twoSum = function() {
    let sumArray = [];

    let i = 0;
    while (i < this.length) {
      let j = i + 1;
      while (j < this.length) {
        if (this[i] + this[j] === 0) {
          sumArray.push([this[i], this[j]]);
        }
        j++;
      }
      i++;
    }
    return sumArray;
}

arr = [1, -1, -4, 4, 3, 5, -3];
console.log(arr.twoSum());


Array.prototype.transpose = function() {
  let transposed_arr = [];

  let new_outer_length = this[0].length; // 4
  let new_inner_length = this.length;  // 2

  for (let i = 0; i < new_outer_length; i++) { //length = 4
      let subArr = [];
      
      for (let j = 0; j < new_inner_length; j++) { //length = 2
      subArr.push(this[j][i]);
    }
    transposed_arr.push(subArr);
  }
  return transposed_arr;
};

twoDArray = [[1, 2, 3, 4], [5,6, 7, 8]]; // expect transpose to: [[1,4], [2,5], [3, 6]]
console.log(twoDArray.transpose());


