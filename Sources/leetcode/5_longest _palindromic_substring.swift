class LongestPalindrome_5{
    //两种回文型: abcba abccba
    static let string = "你知不知道奶牛产牛奶?"
    static func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        let indexStart = s.startIndex
        let indexEnd = s.index(before: s.endIndex)
        var indexCurrent = indexStart
        var indexPre: String.Index?
        var indexPost: String.Index?
        var lengthMax = 1
        var lengthCurrent = 1
        var stringPalindrome = String(s[indexStart])
        var needUpdate: Bool = false
        var indexUpdateStart: String.Index?
        var indexUpdateEnd: String.Index?
        //奇数回文型
        for i in 0..<s.count {
            indexCurrent = s.index(indexStart, offsetBy: i)
            if i != 0 {
                indexPre = s.index(indexCurrent, offsetBy: -1)
            } else {
                indexPre = nil
            }
            if i != s.count-1 {
                indexPost = s.index(indexCurrent, offsetBy: 1)
            } else {
                indexPost = nil
            }
            lengthCurrent = 1
            while indexCurrent != indexStart && indexCurrent != indexEnd {
                print("IndexPre:\(indexPre == nil ? "nil" : "\(s[indexPre!])"), IndexPost:\(indexPost == nil ? "nil" : "\(s[indexPost!])")")
                if let indexPreSafe = indexPre, let indexPostSafe = indexPost, s[indexPreSafe] == s[indexPostSafe] {
                    lengthCurrent += 2
                    if lengthCurrent > lengthMax {
                        lengthMax = lengthCurrent
                        needUpdate = true
                        indexUpdateStart = indexPreSafe
                        indexUpdateEnd = indexPostSafe
                    }
                    if indexPreSafe != indexStart {
                        indexPre = s.index(indexPre!, offsetBy: -1)
                    } else {
                        indexPre = nil
                    }
                    if indexPostSafe != indexEnd {
                        indexPost = s.index(indexPostSafe, offsetBy: 1)
                    } else {
                        indexPost = nil
                    }
                } else {
                    break
                }
            }
            if needUpdate == true {
                needUpdate = false
                stringPalindrome = String(s[indexUpdateStart!...indexUpdateEnd!])
            }
        }
        //偶数回文型
        needUpdate = false
        for i in 0..<s.count {
            indexCurrent = s.index(indexStart, offsetBy: i)
            indexPre = indexCurrent
            if i != s.count-1 {
                indexPost = s.index(indexCurrent, offsetBy: 1)
            } else {
                indexPost = nil
            }
            lengthCurrent = 0
            while indexCurrent != indexEnd {
                if let indexPreSafe = indexPre, let indexPostSafe = indexPost, s[indexPreSafe] == s[indexPostSafe] {
                    lengthCurrent += 2
                    if lengthCurrent > lengthMax {
                        lengthMax = lengthCurrent
                        needUpdate = true
                        indexUpdateStart = indexPreSafe
                        indexUpdateEnd = indexPostSafe
                    }
                    if indexPreSafe != indexStart {
                        indexPre = s.index(indexPreSafe, offsetBy: -1)
                    } else {
                        indexPre = nil
                    }
                    if indexPostSafe != indexEnd {
                        indexPost = s.index(indexPostSafe, offsetBy: 1)
                    } else {
                        indexPost = nil
                    }
                } else {
                    break
                }
            }
            if needUpdate == true {
                needUpdate = false
                stringPalindrome = String(s[indexUpdateStart!...indexUpdateEnd!])
            }
        }
        return stringPalindrome
    }
}