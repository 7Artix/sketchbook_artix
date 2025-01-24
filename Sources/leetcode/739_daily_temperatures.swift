class Solution_739 {
    static let temperatures1 = [73,74,75,71,69,72,76,73]
    static let temperatures2 = [75,71,69,72,76,73]
    static func dailyTemperatures_ON2(_ temperatures: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: temperatures.count)
        for (day, temperature) in temperatures.dropLast().enumerated() {
            for (dayAnother, temperatureAnother) in temperatures.suffix(from: day+1).enumerated() {
                if temperatureAnother > temperature {
                    result[day] = dayAnother + 1
                    break
                }
            }
        }
        return result
    }
    static func dailyTemperatures_ON(_ temperatures: [Int]) -> [Int] {
        var answer = Array(repeating: 0, count: temperatures.count)
        var stack: [Int] = [] // Stack stores indices of temperatures array
        for i in 0..<temperatures.count {
            let array = stack.map{temperatures[$0]}
            print(stack)
            print(array)
            while let lastIndex = stack.last, temperatures[i] > temperatures[lastIndex] {
                stack.removeLast()
                answer[lastIndex] = i - lastIndex // Compute the wait days
            }
            stack.append(i) // Push current index to the stack
        }
        return answer
    }
}