class ThreeSum_15 {
    static let nums = [-1,0,1,2,-1,-4]
    static func threeSumBruteForce(_ nums: [Int]) -> [[Int]] {
        var resultsTemp: [[Int]] = []
        var buffer: [[Int]] = []
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if !buffer.contains([nums[i],nums[j]]) && !buffer.contains([nums[j],nums[i]]) {
                    buffer.append([nums[i],nums[j]])
                } else {
                    continue
                }
                for k in j+1..<nums.count {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        if nums[i]==0 && nums[j] == 0 && nums[k] == 0 {
                            resultsTemp.append([0,0,0])
                            continue
                        }
                        let arrayTemp = [nums[i],nums[j],nums[k]]
                        let min = min(nums[i],nums[j],nums[k])
                        let max = max(nums[i],nums[j],nums[k])
                        let indexMin = arrayTemp.firstIndex(of: min)!
                        let indexMax = arrayTemp.firstIndex(of: max)!
                        let indexMed = 3-indexMax-indexMin
                        resultsTemp.append([arrayTemp[indexMin],arrayTemp[indexMed],arrayTemp[indexMax]])
                    }
                }
            }
        }
        return Array(Set(resultsTemp))
    }
    static func threeSum(_ nums: [Int]) -> [[Int]] {
        let numsSorted = nums.sorted()
        var results: [[Int]] = []
        for i in 0..<numsSorted.count {
            // 跳过重复的数字
            if i > 0 && numsSorted[i] == numsSorted[i - 1] {
                continue
            }
            var left = i + 1
            var right = numsSorted.count - 1
            while left < right {
                let sum = numsSorted[i] + numsSorted[left] + numsSorted[right]
                if sum == 0 {
                    results.append([numsSorted[i], numsSorted[left], numsSorted[right]])
                    // 跳过重复的左指针数字
                    while left < right && numsSorted[left] == numsSorted[left + 1] {
                        left += 1
                    }
                    // 跳过重复的右指针数字
                    while left < right && numsSorted[right] == numsSorted[right - 1] {
                        right -= 1
                    }
                    // 移动双指针
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return results
    }
}