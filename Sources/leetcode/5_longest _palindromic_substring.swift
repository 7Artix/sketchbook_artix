class LongestPalindrome_5{
    static let string = "cbbd"
    static func longestPalindrome(_ s: String) -> String {
        let indexStart = s.startIndex
        var indexCurrent = indexStart
        var indexExpect = indexCurrent
        var charExpect: Character? = s[indexStart]
        var lengthMax = 1
        var lengthCurrent = 1
        var stringPalindrome = ""
        for (offset, _) in s.enumerated().dropFirst() {
            indexCurrent = s.index(indexStart, offsetBy: offset)
            print("char:\(s[indexCurrent]), expect:\(charExpect ?? "@")")
            if s[indexCurrent] == charExpect {
                lengthCurrent += 1
                if lengthCurrent > lengthMax {
                    lengthMax = lengthCurrent
                    stringPalindrome = String(s[indexExpect...indexCurrent])
                    print(stringPalindrome)
                }
                if indexExpect != indexStart {
                    indexExpect = s.index(indexExpect, offsetBy: -1)
                    charExpect = s[indexExpect]
                } else {
                    charExpect = nil
                }
            } else {
                indexExpect = s.index(indexCurrent, offsetBy: -1)
                charExpect = s[indexExpect]
                lengthCurrent = 1
            }
        }
        return stringPalindrome
    }
}