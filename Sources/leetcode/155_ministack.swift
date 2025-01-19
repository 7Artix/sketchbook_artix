class MinStack_155 {
    var stack: [Int] = []
    var stackMini: [Int] = []

    init() {}
    
    func push(_ val: Int) {
        stack.append(val)
        if stackMini.isEmpty || stackMini.last! >= val {
            stackMini.append(val)
        }
    }
    
    func pop() {
        let value = stack.last!
        stack = stack.dropLast()
        if value == stackMini.last! {
            stackMini = stackMini.dropLast()
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return stackMini.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */