class StringToIntegerAtoi_8 {
    static let string = " +  412"
    static func myAtoi(_ s: String) -> Int {
        let characters = Array(s)
        var indexNumberStart = 0
        var isNegative = false
        var isSigned = false
        var result = 0
        //寻找第一个数字
        for i in 0..<characters.count {
            if characters[i].isNumber {
                indexNumberStart = i
                break
            } else if characters[i] == " " {
                if isSigned {
                    return 0
                } else {
                    continue
                }
            } else if characters[i] == "-" {
                if !isSigned {
                    isNegative = true
                    isSigned = true
                    continue
                } else {
                    return 0
                }
            } else if characters[i] == "+" {
                if !isSigned {
                    isSigned = true
                    continue
                } else {
                    return 0
                }
            } else {
                return 0
            }
        }
        for i in indexNumberStart..<characters.count {
            if characters[i].isNumber {
                result = result*10 + characters[i].wholeNumberValue!
                if result > (Int64(Int32.max) + 1) {
                    break
                }
            } else {
                break
            }
        }
        if isNegative {
            if -result > Int32.min {
                return -result
            } else {
                return Int(Int32.min)
            }
        } else {
            if result < Int32.max {
                return result
            } else {
                return Int(Int32.max)
            }
        }
    }
}