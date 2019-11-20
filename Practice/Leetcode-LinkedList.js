// Reverse Linked List
// Example:
// Input: 1 -> 2 -> 3 -> 4 -> 5 -> NULL
// Output: 5 -> 4 -> 3 -> 2 -> 1 -> NULL

function ListNode(val) {
  this.val = val;
  this.next = null;
}

var reverseList = function (head) {
  let prev = null;
  let curr = head;
  let next;

  while(curr){
    next = curr.next;
    curr.next = prev;
    prev = curr;
    curr = next;
  } 

  return prev;
};

let a = new ListNode(1);
let b = new ListNode(2);
let c = new ListNode(3);
let d = new ListNode(4);
let e = new ListNode(null);

a.next = b;
b.next = c;
c.next = d;
d.next = e;

// console.log(reverseList(a));


// Merge Two Sorted Lists
// Merge two sorted linked lists and return it as a new list.The new list should be made by splicing together the nodes of the first two lists.
//   Example:
// Input: 1 -> 2 -> 4, 1 -> 3 -> 4
// Output: 1 -> 1 -> 2 -> 3 -> 4 -> 4

var mergeTwoLists = function(l1, l2){
  let newList = {val: -1, next: null};
  let runner = newList;

  while(l1 && l2){
    if(l1.val > l2.val){
      runner.next = l2;
      l2 = l2.next;
    }else{
      runner.next = l1;
      l1 = l1.next;
    }
    runner = runner.next;
  }
  // l1 = 1->2->3, l2 = 10->20->30
  // In that case l1, will point to null and while loop will break
  // Simply point runner to l2. We do not have to add individual nodes
  runner.next = l1 || l2;
  return newList.next;
}