// Merge Sorted Array
// Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
//   Note:
// The number of elements initialized in nums1 and nums2 are m and n respectively.
// You may assume that nums1 has enough space(size that is greater or equal to m + n) to hold additional elements from nums2.
//   Example:
// Input:
let nums1 = [1, 2, 3, 0, 0, 0];
let m = 3;
let nums2 = [2, 5, 6];
let n = 3;
// Output: [1, 2, 2, 3, 5, 6]

var merge = function (nums1, m, nums2, n) {
  let i = 0;
  let j = 0;
  while(i < m && j < n){
    if(nums1[i] < nums2[j]){
      i++;
    }else{
      nums1.splice(i, 0, nums2[j])
      j++;
    }
  }
  return nums1;
};

console.log(merge(nums1, m, nums2, n))