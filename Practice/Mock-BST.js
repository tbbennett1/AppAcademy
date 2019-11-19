//      3.          10
//  1.    4.     8      13,    9 
//                 null         
// return largest number in the bst smaller than target
// O(logn) runtime. 
// iteratively O(1)
// 8 

// class TreeNode left right val
// if target < root.val and bst() = null return root

function bst(target, root) {
  // if target < root -> left other -> right
  // bst root child
  if (root == null) return null;

  if (target < root.val) {
    return bst(target, root.left);
  } else if (target > root.val) {
    let res = bst(target, root.right);
    if (res === null) return root;
    else return res;
  }
}