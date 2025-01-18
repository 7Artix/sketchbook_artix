class TopKFrequent_347 {
    static let nums = [1,1,1,2,2,3]
    static let k = 2
    static func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dictionary = [Int: Int]()
        for num in nums {
            dictionary[num, default: 0] += 1
        }
        return dictionary
            .sorted { $0.value > $1.value }
            .prefix(k)
            .map { $0.key }
    }
}