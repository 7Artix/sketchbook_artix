class ZigzagConversion_6 {
    static let string = "AB"
    // "PAYPALISHIRING" 4
    // P     I    N
    // A   L S  I G
    // Y A   H R
    // P     I

    // "PAYPALISHIRING" 3
    // P   A   H   N
    // A P L S I I G
    // Y   I   R
    //分成3部分处理: 最上面一行的拐点 & 中间部分 & 最下面一行的拐点
    static func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || numRows >= s.count{
            return s
        }
        let sArray = Array(s)
        var stringResult = ""
        let divisionMax = (numRows-2)*2+1
        let divisionHalfSide = divisionMax/2
        //处理最上面一行拐点
        var indexCurrent = 0
        var indexMirror = 0
        while indexCurrent < sArray.count {
            stringResult.append(sArray[indexCurrent])
            indexCurrent += divisionMax+1
        }
        //处理中间部分
        if numRows > 2 {
            for offset in 1...divisionHalfSide {
                indexCurrent = offset
                while indexCurrent < sArray.count {
                    stringResult.append(sArray[indexCurrent])
                    indexMirror = indexCurrent+(divisionHalfSide+1-offset)*2
                    if indexMirror < sArray.count {
                        stringResult.append(sArray[indexMirror])
                    }
                    indexCurrent += divisionMax+1
                }
            }
        }
        //处理最下面一行的拐点
        indexCurrent = divisionHalfSide+1
        while indexCurrent < sArray.count {
            stringResult.append(sArray[indexCurrent])
            indexCurrent += divisionMax+1
        }
        return stringResult
    }

    static func convertAnother(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || numRows >= s.count {
            return s
        }
        var result = [String](repeating: "", count: numRows)
        var currentRow = 0
        var goingDown = false
        
        for char in s {
            result[currentRow] += String(char)
            // 当到达顶部或底部时反转方向
            if currentRow == 0 || currentRow == numRows - 1 {
                goingDown.toggle()
            }
            // 按照当前方向调整行索引
            currentRow += goingDown ? 1 : -1
        }
        // 将所有行的结果拼接起来
        return result.joined()
    }
}