class ExpressionMatch_10 {
    static let string = "aaa"
    static let pattern = "a*a"
    static func isMatch_1(_ s: String, _ p: String) -> Bool {
        var result = true
        let pattern = Array(p)
        var indexPattern = 0
        var characterRepeatPrevious: String.Element?
        var inRepeatMode = false
        var patternOver = false
        var index = s.startIndex
        while index < s.endIndex {
            if inRepeatMode {
                if s[index] == characterRepeatPrevious {
                    index = s.index(after: index)
                    continue
                } else if s[index] == pattern[indexPattern] {
                    inRepeatMode = false
                    indexPattern += 1
                    if indexPattern >= pattern.count {
                        patternOver = true
                    }
                    index = s.index(after: index)
                    continue
                } else if pattern[indexPattern] == "." {
                    indexPattern += 1
                    if indexPattern >= pattern.count {
                        patternOver = true
                    }
                    index = s.index(after: index)
                    continue
                } else {
                    result = false
                    break
                }
            } else {
                if patternOver {
                    return false
                }
                if pattern[indexPattern] == "*" {
                    inRepeatMode = true
                    characterRepeatPrevious = pattern[indexPattern-1]
                    if characterRepeatPrevious == "." || s[index] == characterRepeatPrevious {
                        index = s.index(after: index)
                        indexPattern += 1
                        if indexPattern >= pattern.count {
                            patternOver = true
                        }
                        continue
                    } else {
                        result = false
                        break
                    }
                } else if pattern[indexPattern] == "." {
                    indexPattern += 1
                    if indexPattern >= pattern.count {
                        patternOver = true
                    }
                    index = s.index(after: index)
                    continue
                }
                if s[index] == pattern[indexPattern] {
                    indexPattern += 1
                    if indexPattern >= pattern.count {
                        patternOver = true
                    }
                    index = s.index(after: index)
                    continue
                } else {
                    indexPattern += 1
                    if indexPattern >= pattern.count {
                        patternOver = true
                    }
                    if pattern[indexPattern] == "*" {
                        indexPattern += 1
                        if indexPattern >= pattern.count {
                            patternOver = true
                        }
                        continue
                    } else {
                        result = false
                    break
                    }
                }
            }
        }
        print(patternOver)
        if !patternOver {
            return false
        }
        return result
    }
    // 递归算法的实现步骤
	// 1.   结束条件：
	//    •	如果模式字符串 p 用完了，检查字符串 s 是否也用完。
	//    •	如果字符串 s 用完了，但模式 p 还有剩余，只能匹配空字符串的情况需要额外判断。
	// 2.	匹配当前字符：
	//    •	当前字符匹配成功的条件：
	//    •	p[j] == s[i]，即字符完全相同。
	//    •	p[j] == '.'，可以匹配任意字符。
	// 3.	处理 *：
	//    •	* 表示前一个字符可以出现零次或多次：
	//    •	零次：直接跳过当前字符和 *，递归检查 s 和 p[j+2:]。
	//    •	多次：当前字符匹配成功时，递归检查 s[i+1:] 和 p[j:]，即继续匹配。
	// 4.	普通字符或 . 的处理：
	//    •	当前字符匹配后，直接递归处理 s[i+1:] 和 p[j+1:]。
    static func isMatch_2(_ s: String, _ p: String) -> Bool {
        return isMatchRecursive(s: Array(s), p: Array(p), indexS: 0, indexP: 0)
    }
    static func isMatchRecursive(s: [Character], p: [Character], indexS: Int, indexP: Int) -> Bool {
        if indexP == p.count {
            return indexS == s.count
        }
        let isMatchedCurrent = indexS < s.count && (s[indexS] == p[indexP] || p[indexP] == ".")
        if indexP + 1 < p.count && p[indexP + 1] == "*" {
            return isMatchRecursive(s: s, p: p, indexS: indexS, indexP: indexP+2) || isMatchedCurrent && isMatchRecursive(s: s, p: p, indexS: indexS+1, indexP: indexP)
        } else {
            return isMatchedCurrent && isMatchRecursive(s: s, p: p, indexS: indexS+1, indexP: indexP+1)
        }
    }
    // 动态规划
    func isMatch_3(_ s: String, _ p: String) -> Bool {
       let sArray = Array(s)
        let pArray = Array(p)
        let m = sArray.count
        let n = pArray.count
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[m][n] = true
        for i in stride(from: m, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 0, by: -1) {
                let firstMatch = (i < m && (sArray[i] == pArray[j] || pArray[j] == "."))
                if j + 1 < n && pArray[j + 1] == "*" {
                    dp[i][j] = dp[i][j + 2] || (firstMatch && dp[i + 1][j])
                } else {
                    dp[i][j] = firstMatch && dp[i + 1][j + 1]
                }
            }
        }
        return dp[0][0]
    }
}