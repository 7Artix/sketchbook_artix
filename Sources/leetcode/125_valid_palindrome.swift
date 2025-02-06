class Solution_125 {
    static let string = "A man, a plan, a canal: Panama"
    static func isPalindrome(_ s: String) -> Bool {
        let array = Array(s.lowercased().filter {$0.isLetter || $0.isNumber})
        var pointerLeft = 0
        var pointerRight = array.count - 1
        while pointerLeft < pointerRight {
            if array[pointerLeft] != array[pointerRight] {
                return false
            } else {
                pointerLeft += 1
                pointerRight -= 1
            }
        }
        return true
    }
    static func isPalindrome_2(_ s: String) -> Bool {
        let filtered = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return filtered == String(filtered.reversed())
    }
}