class GroupAnagrams_49 {
    static let strings = ["eat","tea","tan","ate","nat","bat"]
    static func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dictionary = [String: [String]]()
        for string in strs {
            let stringSorted = String(string.sorted())
            dictionary[stringSorted, default: []].append(string)
        }
        let result: [[String]] = Array(dictionary.values)
        return result
    }
}