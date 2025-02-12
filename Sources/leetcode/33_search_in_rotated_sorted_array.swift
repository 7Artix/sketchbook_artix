class Solution_33 {
    static let nums = [3,1]
    static let target = 3
    static func search_double_logn(_ nums: [Int], _ target: Int) -> Int {
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
        let rotor = pointerLeft
        let numsSorted = Array(nums.dropFirst(pointerLeft) + nums.prefix(pointerLeft))
        pointerLeft = 0
        pointerRight = numsSorted.count - 1
        print(numsSorted, rotor)
        while pointerLeft <= pointerRight {
            let pointerMid = pointerLeft + (pointerRight - pointerLeft) / 2
            print(pointerMid)
            if numsSorted[pointerMid] == target {
                if pointerMid + rotor <= nums.count - 1 {
                    return pointerMid + rotor
                } else {
                    return pointerMid + rotor - nums.count
                }
            }else if numsSorted[pointerMid] < target {
                pointerLeft = pointerMid + 1
            } else {
                pointerRight = pointerMid - 1
            }
            print(pointerLeft, pointerRight)
        }
        return -1
    }
    static func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = left + (right - left) / 2

            if nums[mid] == target {
                return mid  // Target found
            }
            // Determine which half is sorted
            if nums[left] <= nums[mid] {  // Left half is sorted
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1  // Search in left half
                } else {
                    left = mid + 1  // Search in right half
                }
            } else {  // Right half is sorted
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1  // Search in right half
                } else {
                    right = mid - 1  // Search in left half
                }
            }
        }
        return -1  // Target not found
    }
}