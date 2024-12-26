let result = AddTwoNumbers_2.addTwoNumbers(AddTwoNumbers_2.l11, AddTwoNumbers_2.l21)

// 打印结果链表
func printList(_ head: ListNode?) {
    var current = head
    while current != nil {
        print(current!.val, terminator: " -> ")
        current = current?.next
    }
    print("nil")
}

printList(result)