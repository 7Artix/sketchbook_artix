class PalindromeNumber_9 {
    static let testNumber = 910192
    static func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if (0...9).contains(x) {
            return true
        }
        let digitCount = String(x).count
        var result = true
        for i in 1...(digitCount/2) {
            let baseLeft = powArtix(base: 10, exponent: digitCount - i)
            let baseRight = powArtix(base: 10, exponent: i)
            let digitLeft = ((x - x % baseLeft) / baseLeft) % 10
            let digitRight = (x % baseRight) * 10 / baseRight
            print("baseLeft:\(baseLeft), baseRight:\(baseRight), digitLeft:\(digitLeft), digitRight:\(digitRight)")
            if digitLeft != digitRight {
                result = false
            }
        }
        return result
    }
    static func powArtix(base: Int, exponent: Int) -> Int {
        var result = 1
        for _ in 0..<exponent {
            result *= base
        }
        return result
    }
    static func isPalindromeOptimized(_ x: Int) -> Bool {
        if x < 0 { return false }
        if (0...9).contains(x) { return true }
        
        var leftDivisor = 1
        var rightDivisor = 1
        var temp = x
        while temp >= 10 {
            leftDivisor *= 10
            temp /= 10
        }
        while leftDivisor > rightDivisor {
            let leftDigit = (x / leftDivisor) % 10
            let rightDigit = (x / rightDivisor) % 10
            if leftDigit != rightDigit { return false }
            leftDivisor /= 10
            rightDivisor *= 10
        }
        return true
    }
}