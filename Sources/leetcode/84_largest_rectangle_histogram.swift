class Solution_84 {
    static let heights = [2,1,5,6,2,3]
    static func largestRectangleArea(_ heights: [Int]) -> Int {
        var stackIncreasing: [Int] = []
        var areaMax = 0
        for index in 0..<heights.count {
            if index == 0 || heights[index] > heights[index-1] {
                stackIncreasing.append(index)
            } else {
                var width = 0
                while let heightLast = stackIncreasing.popLast() {
                    if heightLast > heights[index] {
                        width += 1
                        let areaCurrent = width * heightLast
                        areaMax = max(areaCurrent, areaMax)
                    } else {
                        break
                    }
                }
                stackIncreasing.append(index)
            }
        }
        // for index in stackIncreasing {

        // }
        return areaMax
    }
}