class Solution_704 {
    static let nums = [-1,0,3,5,9,12]
    static let target = 9
    static let target1 = 0
    static func search(_ nums: [Int], _ target: Int) -> Int {
        if target == nums.last {
            return nums.count - 1
        }
        var pointerLeft = 0
        var pointerRight = nums.count - 1
        var pointerMid = (pointerLeft + pointerRight) / 2
        while nums[pointerMid] != target {
            if (pointerRight - pointerLeft) <= 1 {
                return -1
            }
            if nums[pointerMid] > target {
                pointerRight = pointerMid
                pointerMid = (pointerLeft + pointerRight) / 2
            } else {
                pointerLeft = pointerMid
                pointerMid = (pointerLeft + pointerRight) / 2
            }
        }
        return pointerMid
    }
    static func searchOptimized(_ nums: [Int], _ target: Int) -> Int {
        var pointerLeft = 0
        var pointerRight = nums.count - 1
        
        while pointerLeft <= pointerRight {
            let pointerMid = pointerLeft + (pointerRight - pointerLeft) / 2
            
            if nums[pointerMid] == target {
                return pointerMid
            } else if nums[pointerMid] < target {
                pointerLeft = pointerMid + 1
            } else {
                pointerRight = pointerMid - 1
            }
        }
        
        return -1
    }
}
