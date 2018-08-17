class ListNode {
    constructor(value, next = null) {
        this.value = value;
        this.next = next;
    }
}

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

/* 707 */


