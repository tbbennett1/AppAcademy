function binarySearch(array, target) {
  if(array.length === 0){
    return false;
  }

  let mid = Math.floor(array.length / 2);
  let left = array.slice(0, mid);
  let right = array.slice(mid + 1)

  if(target < array[mid]){
    return binarySearch(left, target);
  }else if(target > array[mid]){
    return binarySearch(right, target);
  }else{
    return true;
  }
}

function binarySearchIndex(array, target, lo = 0, hi = array.length - 1) {
  if (lo === hi) {
    return -1;
  }

  let mid = Math.floor((lo + hi) / 2);

  if (target < array[mid]) {
    return binarySearchIndex(array, target, lo, mid);
  } else if (target > array[mid]) {
    return binarySearchIndex(array, target, mid + 1, hi);
  } else {
    return mid
  }
}


module.exports = {
    binarySearch,
    binarySearchIndex
};