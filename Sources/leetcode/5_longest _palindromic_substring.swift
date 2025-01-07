class LongestPalindrome_5{
    //两种回文型: abcba abccba
    static let string = "abcbaa"
    static func longestPalindrome(_ s: String) -> String {
        if s.count == 1 {
            return s
        } else if s.count == 2 {
            if s.first == s.last {
                return s
            } else {
                return String(s.first!)
            }
        }
        //s有最少3个元素
        let indexStart = s.startIndex
        var lengthMax = 1
        var lengthCurrent = 1
        var stringPalindrome = ""
        if s.first == s.dropFirst().first {
            lengthMax = 2
            stringPalindrome = String(s.prefix(2))
        }
        var indexPrePre: String.Index? = indexStart
        var indexPre = s.index(indexStart, offsetBy: 1)
        var indexCurrent: String.Index
        //从第[2]个字符开始
        for i in 2..<s.count {
            indexCurrent = s.index(indexStart, offsetBy: i)
            if s[indexCurrent] == s[indexPre] {
                lengthCurrent += 1
            } else if s[indexCurrent] == s[indexPrePre!] {
                if indexPrePre != indexStart {
                    indexPrePre = s.index(indexPrePre!, offsetBy: -1)
                } else {
                    indexPrePre = nil
                }
            }
        }
        return stringPalindrome
    }
}