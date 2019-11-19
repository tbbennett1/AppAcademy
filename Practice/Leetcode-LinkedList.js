// Reverse Linked List
// Example:
// Input: 1 -> 2 -> 3 -> 4 -> 5 -> NULL
// Output: 5 -> 4 -> 3 -> 2 -> 1 -> NULL

var reverseList = function (head) {
  let prev = new ListNode(null);
  let curr = head;

  while(curr != null){
    let next = new ListNode(curr.next);
    curr.next = prev;
    prev = curr;
    curr = next;
  } 

  return prev;
};