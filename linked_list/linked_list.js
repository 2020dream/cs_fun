/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

class ListNode {
    constructor(value, next = null) {
        this.value = value;
        this.next = next;
    }
}

/* 21 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var mergeTwoLists = function(l1, l2) {
    if (l1 === null) return l2;
    if (l2 === null) return l1;
   
    if (l1.val < l2.val) {
        l1.next = mergeTwoLists(l1.next, l2);
        return l1;
    } else {
        l2.next = mergeTwoLists(l1, l2.next);
        return l2;
    }
};

/* 83 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var deleteDuplicates = function(head) {
    if (head === null || head.next === null) return head;
    
    let prev = head;
    let curr = prev.next;
    while (curr) {
        if (prev.val === curr.val) {
            prev.next = curr.next;
        } else {
            prev = curr;
        } 
        curr = prev.next;
    }   
    return head;
};

/* 141 */
var hasCycle = function(head) {
    if (head === null || head.next === null) return false;
    let node1 = head;
    let node2 = head;
    while (node2 !== null && node2.next !== null) {
        node1 = node1.next;
        node2 = node2.next.next;
        if (node1 === node2) {
            return true;
        }    
    }
    return false;
};

/* 160 */
/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
    if (headA === null || headB === null) return null;
    
    let currentA = headA;
    let currentB = headB;
    let cycleA = 0;
    let cycleB = 0;
    
    while (currentA !== currentB) {
        currentA = currentA.next;
        currentB = currentB.next;
        
        if (currentA === null) {
            if (cycleA === 0) {
                currentA = headB;
                cycleA += 1;
            } else {
                currentA = headA;
                cycleA += 1;
            }
        }
        
        if (currentB === null) {
            if (cycleB === 0) {
                currentB = headA;
                cycleB += 1;
            } else {
                currentB = headB;
                cycleB += 1;
            }
        }
        if (cycleA === 2 || cycleB === 2) return null;
    }
    return currentA; 
};

/* 203 */
var removeElements = function(head, val) {
    while (head && head.val === val) head = head.next;
    if (head === null) return null;
    
    let prev = head;
    while (prev && prev.next) {
        if (prev.next.val === val) prev.next = prev.next.next;
        else prev = prev.next;
    }
    return head;
};

/* 206 */
var reverseList = function(head) {
    if (head === null || head.next === null) return head;
    
    let current = head;
    let previous = null;
    while (current !== null) {
        let temp = current.next;
        current.next = previous;
        previous = current;
        current = temp;      
    }
    return previous;  
};


/* 234 */
/**
 * @param {ListNode} head
 * @return {boolean}
 */
var isPalindrome = function(head) {
    if (head === null || head.next === null) return true;
    
    let slow = head;
    let fast = head.next;
    while (fast && fast.next) {
        slow = slow.next;
        fast = fast.next.next;
    }
    
    let mid = slow;
    let prev = null;
    let curr = mid.next;
    while (curr) {
        temp = curr.next;
        curr.next = prev;
        prev = curr;
        curr = temp;
    }
    mid.next = prev;
    
    let left = head;
    let right = mid.next;
    while (right) {
        if (left.val !== right.val) return false;
        left = left.next;
        right = right.next;
    }
    return true;
};

/* 237 */
/**
 * @param {ListNode} node
 * @return {void} Do not return anything, modify node in-place instead.
 */
var deleteNode = function(node) {
    node.val = node.next.val;
    node.next = node.next.next;
};

/* 876 */
var middleNode = function(head) {
    if (head === null) return;
    if (head.next === null) return head;
    
    let slow = head;
    let fast = head.next;
    while (fast) {
        slow = slow.next;
        fast = fast.next;
        if (fast) {
            fast = fast.next;
        }
    }
    return slow;
};






