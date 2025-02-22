class Solution_567 {
    static let s1 = "abcdxabcde", s2 = "abcdeabcdx"
    static func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var dictionaryCurrent = [Character: Int]()
        for char in s1 {
            dictionaryCurrent[char, default: 0] += 1
        }
        let dictionaryTarget = dictionaryCurrent
        var sumTarget = 0
        for value in dictionaryTarget.values {
            sumTarget += value
        }
        dictionaryCurrent = [Character: Int]()
        for (index,char) in s2.enumerated() {
            if dictionaryTarget.keys.contains(char) {
                dictionaryCurrent[char, default: 0] += 1
            } else {
                dictionaryCurrent = [Character: Int]()
            }
            var sum = 0
            for value in dictionaryCurrent.values {
                sum += value
            }
            //print(sum)
            if sum > sumTarget {
                print("here")
                 let charPrevious = s2[s2.index(s2.startIndex, offsetBy: index - sumTarget)]
                 dictionaryCurrent[charPrevious]! -= 1
            }
            if dictionaryCurrent == dictionaryTarget {
                return true
            }
            //print(dictionaryCurrent)
        }
        return false
    }
    static func checkInclusion_1(_ s1: String, _ s2: String) -> Bool {
        // Edge case: if s1 is longer than s2, return false immediately
        if s1.count > s2.count {
            return false
        }
        
        // Frequency map for s1
        var dictionaryTarget = [Character: Int]()
        for char in s1 {
            dictionaryTarget[char, default: 0] += 1
        }
        
        // Frequency map for the current sliding window in s2
        var dictionaryCurrent = [Character: Int]()
        
        // Initialize the first window of size `s1.count`
        for i in 0..<s1.count {
            let char = s2[s2.index(s2.startIndex, offsetBy: i)]
            dictionaryCurrent[char, default: 0] += 1
        }
        
        // Compare initial window with target dictionary
        if dictionaryCurrent == dictionaryTarget {
            return true
        }
        
        // Slide the window over s2
        for i in s1.count..<s2.count {
            let startIndex = s2.index(s2.startIndex, offsetBy: i - s1.count)
            let startChar = s2[startIndex] // The character that will be removed from the window
            let endChar = s2[s2.index(s2.startIndex, offsetBy: i)] // The new character to add to the window
            
            // Add the new character to the window
            dictionaryCurrent[endChar, default: 0] += 1
            
            // Remove the old character from the window
            dictionaryCurrent[startChar, default: 0] -= 1
            if dictionaryCurrent[startChar] == 0 {
                dictionaryCurrent[startChar] = nil // Clean up to avoid unnecessary entries
            }
            
            // Compare the updated window with the target dictionary
            if dictionaryCurrent == dictionaryTarget {
                return true
            }
        }
        
        return false
    }
}