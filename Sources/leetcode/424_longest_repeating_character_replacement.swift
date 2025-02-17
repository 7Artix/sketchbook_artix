class Solution_424 {
    static let string = "AABABBA"
    static let k = 1
    static let string2 = "ABAB"
    static let k2 = 0
    static let string3 = "ABBB"
    static let k3 = 2
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
            
            // Update maximum length
            maxLength = max(maxLength, end - start + 1)
        }
        
        return maxLength
    }
}