// Remove Duplicates from Sorted Array
// Given a sorted array nums, remove the duplicates in -place such that each element appear only once and return the new length.
// Do not allocate extra space for another array, you must do this by modifying the input array in -place with O(1) extra memory.
//   Example 1:
// Given nums = [1, 1, 2],
//   Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
// It doesn't matter what you leave beyond the returned length.
// Example 2:
// Given nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4],
//   Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.
// It doesn't matter what values are set beyond the returned length.
// const nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];
// const nums = [1, 1, 2];
var removeDuplicates = function (nums) {
  if(nums.length == 0) return 0;

  let i = 0;
  for(let j = 1; j < nums.length; j++){
    if(nums[j] != nums[i]){
      i++;
      nums[i] = nums[j]
    }
  }
  return i + 1;
};

// console.log(removeDuplicates(nums)) //=> 5

// Rotate Array
// Given an array, rotate the array to the right by k steps, where k is non - negative.
//   Example 1:
// Input: [1, 2, 3, 4, 5, 6, 7] and k = 3
// Output: [5, 6, 7, 1, 2, 3, 4]
// Explanation:
// rotate 1 steps to the right: [7, 1, 2, 3, 4, 5, 6]
// rotate 2 steps to the right: [6, 7, 1, 2, 3, 4, 5]
// rotate 3 steps to the right: [5, 6, 7, 1, 2, 3, 4]
//  Example 2:
// Input: [-1, -100, 3, 99] and k = 2
// Output: [3, 99, -1, -100]
// Explanation:
// rotate 1 steps to the right: [99, -1, -100, 3]
// rotate 2 steps to the right: [3, 99, -1, -100]
const nums = [1, 2, 3, 4, 5, 6, 7]
var rotate = function(nums, k){
  let arr = [];
  for(let i = 0; i < nums.length; i++){
    arr[(i + k) % nums.length] = nums[i];
  }
  for(let i = 0; i < nums.length; i++){
    nums[i] = arr[i];
  }
}

rotate(nums, 3)
console.log(nums)