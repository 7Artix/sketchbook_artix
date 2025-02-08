class Solution_42 {
    static let height1 = [0,1,0,2,1,0,1,3,2,1,2,1]
    static let height2 = [4,2,0,3,2,5]
    static func trap(_ height: [Int]) -> Int {
        var pointerLeft = 0
        var pointerRight = height.count - 1
        var volume = 0
        var heightMax = 0
        var isLeftMoved = false
        var isRightMoved = false
        while pointerLeft < pointerRight {
            //print("L:",pointerLeft, " R:",pointerRight, terminator: "")
            if isLeftMoved {
                isLeftMoved = false
                volume -= min(heightMax, height[pointerLeft])
            } else if isRightMoved {
                isRightMoved = false
                volume -= min(heightMax, height[pointerRight])
            }
            if min(height[pointerLeft], height[pointerRight]) > heightMax {
                let heightPrevious = heightMax
                heightMax = min(height[pointerLeft], height[pointerRight])
                volume += (pointerRight - pointerLeft - 1) * (heightMax - heightPrevious)
            }
            if height[pointerLeft] <= height[pointerRight] {
                pointerLeft += 1
                isLeftMoved = true
            } else {
                pointerRight -= 1
                isRightMoved = true
            }
            //print("\tvolume:", volume)
        }
        return volume
    }
}