class ContainerMax_11 {
    static let heights = [1,8,6,2,5,4,8,3,7]
    //暴力解法,按顺序挑出两个heights,遍历area,时间复杂度为O(N^2)
    static func maxArea_1(_ height: [Int]) -> Int {
        var areaMax = 0
        var areaCurrent = 0
        for i in 0..<height.count {
            for j in 0..<height.count {
                areaCurrent = abs(i-j) * min(height[i],height[j])
                areaMax = max(areaMax, areaCurrent)
            }
        }
        return areaMax
    }
    //双指针寻找短板,时间复杂度O(N)
    static func maxArea_2(_ height: [Int]) -> Int {
        var indexLineLeft = 0
        var indexLineRight = height.count-1
        var areaMax = 0
        var areaCurrent = 0
        while indexLineLeft < indexLineRight {
            areaCurrent = (indexLineRight - indexLineLeft) * min(height[indexLineLeft], height[indexLineRight])
            areaMax = max(areaCurrent, areaMax)
            if height[indexLineLeft] <= height[indexLineRight] {
                indexLineLeft += 1
            } else {
                indexLineRight -= 1
            }
        }
        return areaMax
    }
}