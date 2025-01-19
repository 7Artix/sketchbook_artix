class LongestConsecutive_128 {
    static let nums = [0,3,7,2,5,8,4,6,0,1]
    static func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.isEmpty {return 0}
        let setNums = Set<Int>(nums)
        var lengthMax = 1
        for number in setNums {
            if !setNums.contains(number-1) {
                var i = 1
                while setNums.contains(number+i) {
                    lengthMax = max(lengthMax,i+1)
                    i += 1
                }
            }
        }
        return lengthMax
    }
}