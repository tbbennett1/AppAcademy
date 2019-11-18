// Reverse String
// Write a function that reverses a string.The input string is given as an array of characters char[].
// Do not allocate extra space for another array, you must do this by modifying the input array in -place with O(1) extra memory.
// You may assume all the characters consist of printable ascii characters.
//   Example 1:
// Input: ["h", "e", "l", "l", "o"]
// Output: ["o", "l", "l", "e", "h"]
//  Example 2:
// Input: ["H", "a", "n", "n", "a", "h"]
// Output: ["h", "a", "n", "n", "a", "H"]

var reverseString = function(s){
  let i = 0;
  for(let j = s.length - 1; i < j; j--){
    let temp = s[i];
    s[i] = s[j];
    s[j] = temp;
    i++;
  }
}
// let s = ["H", "a", "n", "n", "a", "h"];
// reverseString(s);
// console.log(s);