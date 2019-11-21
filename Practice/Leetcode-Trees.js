// Max Dept of BT
// Given a binary tree, find its maximum depth.
// The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//   Note: A leaf is a node with no children.
//     Example:
// Given binary tree[3, 9, 20, null, null, 15, 7],
//    3
//   / \
// 9   20
//    /  \
//   15   7
// return its depth = 3.

var maxDepth = function (root) {
  let fringe = [{node: root, depth: 1}];
  let current = fringe[0];
  let max = 0;
  while(current && current.node){
    let node = current.node;
    if(node.left){
      fringe.push({node: node.left, depth: current.depth + 1})
    }

    if(node.right){
      fringe.push({node: node.right, depth: current.depth + 1})
    }

    if(current.depth > max){
      max = current.depth;
    }

    current = fringe.pop();
  }

  return max;
};

// Symmetric Tree
// Given a binary tree, check whether it is a mirror of itself(ie, symmetric around its center).
// For example, this binary tree[1, 2, 2, 3, 4, 4, 3] is symmetric:
//     1
//    / \
//   2    2
//  / \   / \
// 3   4  4   3

var isSymmetric = function (root) {
  
};