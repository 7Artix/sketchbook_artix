class ValidPrentheses_20 {
    static let string = "()[[]]{}"
    static func isValid(_ s: String) -> Bool {
        var stackBrackets: [Character] = []
        for bracket in s {
            //print(stackBrackets)
            if "([{".contains(bracket) {
                stackBrackets.append(bracket)
            } else {
                if let bracketLast = stackBrackets.popLast() {
                    if (bracket == ")" && bracketLast == "(") || (bracket == "]" && bracketLast == "[") || (bracket == "}" && bracketLast == "{") {
                        continue
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        if stackBrackets.isEmpty {
            return true
        } else {
            return false
        }
    }
    static func isValid_1(_ s: String) -> Bool {
        var stack: [Character] = []
        let matchingBrackets: [Character: Character] = [")": "(", "]": "[", "}": "{"]

        for bracket in s {
            if let expectedOpening = matchingBrackets[bracket] {
                if stack.popLast() != expectedOpening {
                    return false
                }
            } else {
                stack.append(bracket)
            }
        }
        return stack.isEmpty
    }
}