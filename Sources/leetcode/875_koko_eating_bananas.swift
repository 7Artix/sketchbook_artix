class Solution_875 {
    static let piles = [9]
    static let h = 8
    static func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var speedLimitUpper = piles.max()!
        var speedLimitLower = 1
        var speedMid = -1
        var speedCache = -1
        while speedLimitLower <= speedLimitUpper {
            speedMid = (speedLimitUpper + speedLimitLower) / 2
            var timeRequired = 0
            for pile in piles {
                let time = (pile % speedMid) == 0 ? (pile/speedMid) : (pile/speedMid+1)
                timeRequired += time
            }
            if timeRequired <= h {
                speedCache = speedMid
                speedLimitUpper = speedMid - 1
            } else {
                speedLimitLower = speedMid + 1
            }
        }
        if speedCache != -1 {
            return speedCache
        } else {
            return speedMid
        }
    }
    static func minEatingSpeed_1(_ piles: [Int], _ h: Int) -> Int {
        var low = 1
        var high = piles.max()!
        while low <= high {
            let mid = (low + high) / 2
            var totalHours = 0

            for pile in piles {
                totalHours += (pile + mid - 1) / mid
            }

            if totalHours <= h {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return low
    }
}