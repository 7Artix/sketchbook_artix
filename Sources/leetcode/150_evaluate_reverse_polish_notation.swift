class EvaluateReversePolishNotation_150 {
    static let tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
    // Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
    // = ((10 * (6 / (12 * -11))) + 17) + 5
    // = ((10 * (6 / -132)) + 17) + 5
    // = ((10 * 0) + 17) + 5
    // = (0 + 17) + 5
    // = 17 + 5
    // = 22
    static func evalRPN(_ tokens: [String]) -> Int {
        var stackNumbers: [Int] = []
        // var stackOperators: [Character] = []
        // var result: Int
        for string in tokens {
            if !"+-*/".contains(string) {
                stackNumbers.append(Int(string)!)
            } else {
                let numberRight = stackNumbers.popLast()!
                let numberLeft = stackNumbers.popLast()!
                var result: Int
                switch string {
                    case "+":
                        result = numberLeft + numberRight
                    case "-":
                        result = numberLeft - numberRight
                    case "*":
                        result = numberLeft * numberRight
                    default:
                        result = numberLeft / numberRight
                }
                stackNumbers.append(result)
            }
        }
        return stackNumbers[0]
    }
}