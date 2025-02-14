class Solution_4 {
    static let nums1 = [1,2,3,4]
    static let nums2 = [2,3]
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let A = nums1, B = nums2
        let m = A.count, n = B.count

        // Ensure A is the smaller array for binary search efficiency
        if m > n {
            return findMedianSortedArrays(B, A)
        }
        
        var left = 0, right = m
        let total = m + n
        let half = (total + 1) / 2
        
        while left <= right {
            let midA = left + (right - left) / 2
            let midB = half - midA

            let left1 = (midA == 0) ? Int.min : A[midA - 1]
            let right1 = (midA == m) ? Int.max : A[midA]
            let left2 = (midB == 0) ? Int.min : B[midB - 1]
            let right2 = (midB == n) ? Int.max : B[midB]

            if left1 <= right2 && left2 <= right1 {
                if total % 2 == 0 {
                    return Double(max(left1, left2) + min(right1, right2)) / 2.0
                } else {
                    return Double(max(left1, left2))
                }
            } else if left1 > right2 {
                right = midA - 1  // Move search space to the left
            } else {
                left = midA + 1   // Move search space to the right
            }
        }
        
        return 0.0 // Should never reach here
    }
}