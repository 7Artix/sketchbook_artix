class ProductExceptSelf_238 {
    static let nums = [1,2,3,4]
    static func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefixes: [Int] = []
        var suffixes: [Int] = []
        var result: [Int] = []
        for i in 0..<nums.count {
            if i == 0 {
                prefixes.append(nums[0])
                suffixes.insert(nums[nums.count-1], at: 0)
            } else {
                prefixes.append(nums[i]*prefixes[i-1])
                suffixes.insert(nums[nums.count - 1 - i] * suffixes[0], at: 0)
            }
        }
        for i in 0..<nums.count {
            if i == 0 {
                result.append(suffixes[1])
            } else if i == nums.count-1 {
                result.append(prefixes[nums.count-2])
            } else {
                result.append(prefixes[i-1]*suffixes[i+1])
            }
        }
        return result
    }
    static func productExceptSelfOptimized(_ nums: [Int]) -> [Int] {
        let count = nums.count
        var result = Array(repeating: 1, count: count)
        // First pass: Compute prefix product
        var prefix = 1
        for i in 0..<count {
            result[i] = prefix
            prefix *= nums[i]
        }
        // Second pass: Compute suffix product and multiply in-place
        var suffix = 1
        for i in (0..<count).reversed() {
            result[i] *= suffix
            suffix *= nums[i]
        }
        return result
    }
}