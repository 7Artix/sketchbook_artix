class Solution_76 {
    static let s = "bdab", t = "ab"
                          //0123456789
    static func minWindow(_ s: String, _ t: String) -> String {
        var dictionaryT = [Character: Int]()
        for char in t {
            dictionaryT[char, default: 0] += 1
        }
        let dictionaryCache = dictionaryT
        var stringToProcess = s
        var indexLast = 0
        var countMin = Int.max
        var result = ""
        while stringToProcess.count >= t.count {
            for (index, char) in stringToProcess.enumerated() {
                if dictionaryT.keys.contains(char) {
                    dictionaryT[char]! -= 1
                    if dictionaryT[char] == 0 {
                        dictionaryT.removeValue(forKey: char)
                    }
                    if dictionaryT.isEmpty { indexLast = index; break }
                }
            }
            print(indexLast)
            dictionaryT = dictionaryCache
            print(String(stringToProcess.prefix(indexLast + 1).reversed()))
            for (index, char) in String(stringToProcess.prefix(indexLast + 1).reversed()).enumerated() {
                if dictionaryT.keys.contains(char) {
                    dictionaryT[char]! -= 1
                    if dictionaryT[char] == 0 {
                        dictionaryT.removeValue(forKey: char)
                    }
                    if dictionaryT.isEmpty { 
                        if index + 1 < countMin {
                            result = String(stringToProcess[stringToProcess.index(stringToProcess.startIndex, offsetBy: indexLast - index)...stringToProcess.index(stringToProcess.startIndex, offsetBy: indexLast)])
                            countMin = result.count
                        }
                        break
                    }
                }
            }
            print("result:\(result)")
            if indexLast + 1 > stringToProcess.count {
                break
            } else {
                stringToProcess = String(stringToProcess.suffix(from: stringToProcess.index(stringToProcess.startIndex, offsetBy: indexLast + 1)))
                dictionaryT = dictionaryCache
            }
        }
        return result
    }
    static func minWindow_1(_ s: String, _ t: String) -> String {
        let sArr = Array(s), tArr = Array(t)
        let m = s.count, n = t.count
        
        if m < n { return "" }
        
        // Frequency map for t (target characters)
        var tFrequency = [Character: Int]()
        for char in tArr {
            tFrequency[char, default: 0] += 1
        }
        
        // Sliding window frequency map
        var windowFrequency = [Character: Int]()
        var left = 0, right = 0
        let requiredCount = tFrequency.count
        var formed = 0
        var result: (Int, Int) = (Int.max, -1) // (window size, start index)
        
        // Start sliding window
        while right < m {
            // Add current character to the window
            let rightChar = sArr[right]
            windowFrequency[rightChar, default: 0] += 1
            
            // If current character in window satisfies the frequency in t, increase formed
            if let count = tFrequency[rightChar], windowFrequency[rightChar] == count {
                formed += 1
            }
            
            // Try to shrink the window from the left if all required characters are in the window
            while left <= right && formed == requiredCount {
                let leftChar = sArr[left]
                
                // Update result if a smaller window is found
                if (right - left + 1) < result.0 {
                    result = (right - left + 1, left)
                }
                
                // Remove character from the window and move left pointer
                windowFrequency[leftChar]! -= 1
                if let count = tFrequency[leftChar], windowFrequency[leftChar]! < count {
                    formed -= 1
                }
                
                left += 1
            }
            
            // Expand the window by moving right pointer
            right += 1
        }
        
        // Return the minimum window substring
        return result.1 == -1 ? "" : String(sArr[result.1..<(result.1 + result.0)])
    }
}