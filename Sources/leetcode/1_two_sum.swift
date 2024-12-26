class TwoSum_1 {
    public static let nums = [3,3]
    public static let target = 6
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = [0,0]
        for i in 0..<nums.count {
            let valueNeed = target - nums[i]
            for j in (i+1)..<nums.count {
                if nums[j] == valueNeed {
                    result = [i, j]
                }
            }
        }
        return result
    }
}