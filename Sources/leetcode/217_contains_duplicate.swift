class ContainsDuplicate_217 {
    static let nums = [1,2,3,1]
    static func containsDuplicate(_ nums: [Int]) -> Bool {
        var setHistory = Set<Int>()
        for num in nums {
            if setHistory.contains(num) {
                return true
            } else {
                setHistory.insert(num)
            }
        }
        return false
    }
}