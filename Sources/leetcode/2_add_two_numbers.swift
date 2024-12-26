public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class AddTwoNumbers_2 {
    // 创建链表 2 -> 4 -> 3
    @MainActor public static let l11 = ListNode(2, l12)
    @MainActor public static let l12 = ListNode(4, l13)
    @MainActor public static let l13 = ListNode(3)
    // 创建链表 5 -> 6 -> 4
    @MainActor public static let l21 = ListNode(5, l22)
    @MainActor public static let l22 = ListNode(6, l23)
    @MainActor public static let l23 = ListNode(4)
    
    // 主函数：计算两数相加
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //虚拟头节点
        let dummyHead = ListNode(0)
        var current = dummyHead
        var carry = 0

        var node1 = l1
        var node2 = l2
        
        while node1 != nil || node2 != nil || carry > 0 {
            let val1 = node1?.val ?? 0
            let val2 = node2?.val ?? 0
            let sum = val1 + val2 + carry
            carry = sum / 10
            let newNode = ListNode(sum % 10)
            current.next = newNode
            current = newNode
            node1 = node1?.next
            node2 = node2?.next
        }
        return dummyHead.next
    }
}