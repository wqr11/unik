/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function addTwoNumbers(
  l1: ListNode | null,
  l2: ListNode | null,
): ListNode | null {
  let r = 0;
  let dummy = new ListNode();
  let s = dummy;
  let t = 0;

  while (l1 || l2 || r != 0) {
    t = (l1?.val ?? 0) + (l2?.val ?? 0) + r;
    dummy.val = t % 10;
    r = Math.floor(t / 10);

    l1 = l1?.next || null;
    l2 = l2?.next || null;

    if (l1 || l2 || r != 0) {
      dummy.next = new ListNode();
      dummy = dummy.next;
    }
  }

  return s;
}
