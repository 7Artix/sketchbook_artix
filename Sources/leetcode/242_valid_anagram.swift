class ValidAnagram_242 {
    static let s = "anagram"
    static let t = "nagarama"
    static func isAnagram(_ s: String, _ t: String) -> Bool {
        var countDictS = [Character: Int]()
        var countDictT = [Character: Int]()
        for character in s {
            if let count = countDictS[character] {
                countDictS.updateValue(count+1, forKey: character)
            } else {
                countDictS.updateValue(1, forKey: character)
            }
        }
        for character in t {
            if let count = countDictT[character] {
                countDictT.updateValue(count+1, forKey: character)
            } else {
                countDictT.updateValue(1, forKey: character)
            }
        }
        if countDictT.keys.count != countDictS.keys.count {
            return false
        }
        for character in countDictS.keys {
            if let countT = countDictT[character] {
                if countT == countDictS[character] {
                    continue
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
    static func isAnagram_O_N(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        
        var countDict = [Character: Int]()
        
        for char in s {
            countDict[char, default: 0] += 1
        }
        
        for char in t {
            countDict[char, default: 0] -= 1
        }
        
        return countDict.values.allSatisfy { $0 == 0 }
    }
}