//MARK: KEY POINT
//maxFreq doesn’t need to decrease because maxFreq + k represents the largest valid window size at any given moment. 
// If the remaining part of the string can’t contribute to a larger window, there’s no reason to decrease maxFreq, 
// which would mean shrinking the window unnecessarily.
class Solution_424 {
    static let string = "AABABBA"
    static let k = 1
    static let string2 = "ABAB"
    static let k2 = 0
    static let string3 = "ABBB"
    static let k3 = 2
    static let string4 = "ABAAABBA"
    static let k4 = 1
    static func characterReplacement(_ s: String, _ k: Int) -> Int {
        var charCount = [Character: Int]() // Frequency map
        var start = 0
        var maxLength = 0
        var maxFreq = 0
        for end in 0..<s.count {
            let char = s[s.index(s.startIndex, offsetBy: end)]
            // Update frequency map
            charCount[char, default: 0] += 1
            maxFreq = max(maxFreq, charCount[char]!)
            // Check if window is valid
            if (end - start + 1) - maxFreq > k {
                let startChar = s[s.index(s.startIndex, offsetBy: start)]
                charCount[startChar]! -= 1
                start += 1
            }
            maxLength = max(maxLength, end - start + 1)
        }
        return maxLength
    }
    static func characterReplacementArtix(_ s: String, _ k: Int) -> Int {
        var maxLength = 0
        var start = 0
        var heatMap = [Character: Int]()
        var maxFreq = 0
        for end in 0..<s.count {
            let char = s[s.index(s.startIndex, offsetBy: end)]
            heatMap[char,default: 0] += 1
            maxFreq = max(maxFreq, heatMap[char]!)
            if end - start + 1 - maxFreq > k {
                heatMap[s[s.index(s.startIndex, offsetBy: start)]]! -= 1
                start += 1
            }
            maxLength = max(maxLength,(end - start + 1))
        }
        return maxLength
    }
}