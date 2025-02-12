class Solution_153 {
    static let nums = [1]
    static func findMin(_ nums: [Int]) -> Int {
        var pointerLeft = 0
        var pointerRight = nums.count - 1
        while pointerLeft <= pointerRight {
            let pointerMid = pointerLeft + (pointerRight - pointerLeft) / 2
            if nums[pointerMid] > nums.last! {
                pointerLeft = pointerMid + 1
            } else {
                pointerRight = pointerMid - 1
            }
        }
        return nums[pointerLeft]
    }
}