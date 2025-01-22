class GenerateParenthesis_22 {
    static let number = 4
    static func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        generate("", 0, 0, n, &result)
        return result
    }
    private static func generate(_ current: String, _ open: Int, _ close: Int, _ n: Int, _ result: inout [String]) {
        // Base case: When the current string reaches the required length
        if current.count == n * 2 {
            result.append(current)
            return
        }
        
        // Add an open parenthesis if we haven't used all n open parentheses
        if open < n {
            generate(current + "(", open + 1, close, n, &result)
        }
        
        // Add a closing parenthesis if it doesn't exceed the number of open ones
        if close < open {
            generate(current + ")", open, close + 1, n, &result)
        }
    }
    //n must >= 2
    static func numbersGenerator(_ n: Int) -> [[Int]] {
        var results: [[Int]] = [[n]]
        for i in stride(from: n-1, through: 1, by: -1) {
            let result = [i, n-i]
            results.append(result)
            if result[1] > 1 {
                let miniResults = numbersGenerator(result[1]).dropFirst()
                for miniResult in miniResults {
                    results.append(result.dropLast()+miniResult)
                }
            }
        }
        return results
    }
}

class GenerateParenthesisStack_22 {
    struct State {
        let sequence: String
        let open: Int
        let close: Int
    }
    
    static func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        var stack: [State] = [State(sequence: "", open: 0, close: 0)]
        while !stack.isEmpty {
            let current = stack.removeLast()
            // If sequence is complete, add to result
            if current.sequence.count == n * 2 {
                result.append(current.sequence)
                continue
            }
            // Add an open parenthesis if possible
            if current.open < n {
                stack.append(State(sequence: current.sequence + "(", open: current.open + 1, close: current.close))
            }
            // Add a close parenthesis if possible
            if current.close < current.open {
                stack.append(State(sequence: current.sequence + ")", open: current.open, close: current.close + 1))
            }
        }
        return result
    }
}
