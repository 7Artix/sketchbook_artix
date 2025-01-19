class ValidSudoku_36 {
    static let board1: [[Character]] = 
        [["5","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
    static let board2: [[Character]] = 
        [["8","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
    static func isValidSudoku(_ board: [[Character]]) -> Bool {
        var miniDictionaries: [[[Character: Int]]] = Array(repeating: Array(repeating: [:], count: 3), count: 9)
        var tempDictionaries: [[Character: Int]] = Array(repeating: [:], count: 9)
        for indexRow in 0..<9 {
            for indexCol in 0..<3 {
                for indexElement in 0..<3 {
                    miniDictionaries[indexRow][indexCol][board[indexRow][indexCol*3 + indexElement], default: 0] += 1
                }
            }
        }
        // print(miniDictionaries)
        // process the rows
        for indexRow in 0..<9 {
            tempDictionaries[indexRow] = miniDictionaries[indexRow].reduce(into: [Character: Int]()) { resultTemp, entry in
                for (key, value) in entry {
                    resultTemp[key, default: 0] += value
                }
            }
            for (key, value) in tempDictionaries[indexRow] {
                if key != "." {
                    if value != 1 {
                        return false
                    }
                }
            }
        }
        // process the 3*3 grid
        tempDictionaries = Array(repeating: [:], count: 9)
        for indexRow in 0..<3 {
            for indexCol in 0..<3 {
                tempDictionaries[indexRow*3+indexCol] = miniDictionaries[indexRow*3][indexCol]
                    .merging(miniDictionaries[indexRow*3+1][indexCol]) { current, new in
                        current+new
                    }.merging(miniDictionaries[indexRow*3+2][indexCol]) { current, new in
                        current+new
                    }
                for (key, value) in tempDictionaries[indexRow*3+indexCol] {
                    if key != "." {
                        if value != 1 {
                            return false
                        }
                    }
                }
            }
        }
        // process the cols
        tempDictionaries = Array(repeating: [:], count: 9)
        for indexCol in 0..<9 {
            for indexRow in 0..<9 {
                tempDictionaries[indexCol][board[indexRow][indexCol], default: 0] += 1
            }
            for (key, value) in tempDictionaries[indexCol] {
                if key != "." {
                    if value != 1 {
                        return false
                    }
                }
            }
        }
        // print(tempDictionaries)
        return true
    }
    static func isValidSudoku_1(_ board: [[Character]]) -> Bool {
        var rowSet = Array(repeating: Set<Character>(), count: 9)
        var colSet = Array(repeating: Set<Character>(), count: 9)
        var boxSet = Array(repeating: Set<Character>(), count: 9)

        for row in 0..<9 {
            for col in 0..<9 {
                let num = board[row][col]
                if num == "." { continue }

                let boxIndex = (row / 3) * 3 + col / 3

                if rowSet[row].contains(num) || colSet[col].contains(num) || boxSet[boxIndex].contains(num) {
                    return false
                }

                rowSet[row].insert(num)
                colSet[col].insert(num)
                boxSet[boxIndex].insert(num)
            }
        }
        return true
    }
}