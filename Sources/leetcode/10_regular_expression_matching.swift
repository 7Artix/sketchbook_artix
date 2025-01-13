class ExpressionMatch_10 {
    static let string = "aaa"
    static let pattern = "a*a"
    static func isMatch(_ s: String, _ p: String) -> Bool {
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
}