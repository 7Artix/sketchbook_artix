class Solution_74 {
    static let matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]
    static let target = 60
    static func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var pointerLeft = 0
        var pointerRight = matrix.count - 1
        var indexRow = -1
        while pointerLeft <= pointerRight {
            let pointerMid = (pointerLeft + pointerRight) / 2
            if matrix[pointerMid][0] <= target {
                if pointerMid == matrix.count - 1 {
                    indexRow = pointerMid
                    break
                } else if pointerMid <= matrix.count - 2 {
                    if matrix[pointerMid+1][0] > target {
                        indexRow = pointerMid
                        break
                    } else {
                        pointerLeft = pointerMid + 1
                    }
                }
            } else {
                pointerRight = pointerMid - 1
            }
        }
        if indexRow == -1 {
            return false
        } else {
            pointerLeft = 0
            pointerRight = matrix.first!.count - 1
            while pointerLeft <= pointerRight {
                let pointerMid = (pointerLeft + pointerRight) / 2
                if matrix[indexRow][pointerMid] == target {
                    print("\(indexRow),\(pointerMid)")
                    return true
                } else if matrix[indexRow][pointerMid] < target {
                    pointerLeft = pointerMid + 1
                } else {
                    pointerRight = pointerMid - 1
                }
            }
            return false
        }
    }
    static func searchMatrixOptimized(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        let cols = matrix[0].count
        var left = 0
        var right = rows * cols - 1

        while left <= right {
            let mid = (left + right) / 2
            let row = mid / cols
            let col = mid % cols
            let midValue = matrix[row][col]

            if midValue == target {
                return true
            } else if midValue < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
}